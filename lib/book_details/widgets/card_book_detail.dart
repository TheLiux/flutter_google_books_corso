import 'package:flutter/material.dart';
import 'package:flutter_google_books/book_details/widgets/favourite_icon.dart';
import 'package:flutter_google_books/common/firebase_storage.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';
import 'package:flutter_google_books/common/widgets/book_image_widget.dart';

class CardBookDetail extends StatelessWidget {
  final VolumeInfo volumeInfo;
  final FirebaseStorage _localStorage;

  final textStyle = const TextStyle(
    overflow: TextOverflow.ellipsis,
  );

  const CardBookDetail(this._localStorage, {super.key, required this.volumeInfo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: BookImageWidget(
                    height: 90,
                    width: 90,
                    bordered: true,
                    canShowDialog: true,
                    url: volumeInfo.imageLinks?.thumbnail,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        volumeInfo.title!,
                        maxLines: 2,
                        style: textStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        volumeInfo.authorsToString(),
                        maxLines: 2,
                        style: textStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 12.0),
                  child: FavouriteIcon(
                    _localStorage,
                    volumeInfo: volumeInfo,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                _getDescription(),
                style: const TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDescription() {
    if (volumeInfo.description == null) {
      return "Nessuna descrizione";
    }

    return volumeInfo.description!;
  }
}
