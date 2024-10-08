import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/firebase_storage.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';

class FavouriteIcon extends StatefulWidget {
  final FirebaseStorage _localStorage;
  final VolumeInfo volumeInfo;

  const FavouriteIcon(
    this._localStorage, {
    super.key,
    required this.volumeInfo,
  });

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  final String _key = 'favourites';
  bool _isFavourited = false;
  bool _isLoading = true;

  @override
  void didChangeDependencies() async {
    await _checkIfIsFavourite();
    setState(() {
      _isLoading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: Visibility(
          visible: !_isLoading,
          replacement: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          child: IconButton(
            icon: _getIcon(),
            onPressed: () => _onPressed(),
          ),
        ),
      ),
    );
  }

  Icon _getIcon() {
    if (_isFavourited) {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }

    return const Icon(Icons.favorite_border);
  }

  Future<bool> _checkIfIsFavourite() async {
    final volumeInfo = widget.volumeInfo.toJson().toString();
    final data = await widget._localStorage.getData(_key);

    setState(() {
      _isFavourited = data.contains(volumeInfo.toString());
    });

    return _isFavourited;
  }

  Future<void> _onPressed() async {
    setState(() {
      _isLoading = !_isLoading;
    });

    final volumeInfo = widget.volumeInfo.toJson().toString();
    final data = await widget._localStorage.getData(_key);

    if (_isFavourited) {
      data.remove(volumeInfo);
    } else {
      data.add(volumeInfo);
    }

    widget._localStorage.setData(_key, data);
    setState(() {
      _isLoading = !_isLoading;
      _isFavourited = !_isFavourited;
    });
  }
}
