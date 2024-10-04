import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/extensions/list_extensions.dart';
import 'package:flutter_google_books/common/local_storage.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';

class FavouriteIcon extends StatefulWidget {
  final LocalStorage _localStorage;
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return IconButton(
            icon: _getIcon(),
            onPressed: _onPressed,
          );
        }

        return const CircularProgressIndicator();
      },
      future: _checkIfIsFavourite(),
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
    final volumeInfo = widget.volumeInfo.toJson().toString();
    final data = await widget._localStorage.getData(_key);

    if (_isFavourited) {
      data.remove(volumeInfo);
      widget._localStorage.setData(_key, data);
      return;
    }

    data.add(volumeInfo);
    widget._localStorage.setData(_key, data);
    setState(() {
      _isFavourited = !_isFavourited;
    });
  }
}
