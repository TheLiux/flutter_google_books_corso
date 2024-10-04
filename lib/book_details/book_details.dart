import 'package:flutter/material.dart';
import 'package:flutter_google_books/book_details/widgets/card_book_detail.dart';
import 'package:flutter_google_books/common/local_storage.dart';
import 'package:flutter_google_books/common/models/volume_info.dart';
import 'package:flutter_google_books/common/widgets/custom_app_bar.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as VolumeInfo;
    final LocalStorage localStorage = LocalStorage();

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
