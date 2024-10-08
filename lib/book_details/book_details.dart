import 'package:flutter/material.dart';
import 'package:flutter_google_books/book_details/widgets/card_book_detail.dart';
import 'package:flutter_google_books/common/firebase_storage.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';
import 'package:flutter_google_books/common/widgets/custom_app_bar.dart';

class BookDetails extends StatelessWidget {
  final VolumeInfo args;

  const BookDetails({
    super.key,
    required this.args,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseStorage localStorage = FirebaseStorage();

    return Scaffold(
      appBar: CustomAppBar(
        title: args.title ?? "Dettaglio Libro",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: CardBookDetail(
                localStorage,
                volumeInfo: args,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
