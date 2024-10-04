import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/extensions/list_extensions.dart';
import 'package:flutter_google_books/common/client/client.dart';
import 'package:flutter_google_books/common/models/result.dart';
import 'package:flutter_google_books/common/widgets/custom_app_bar.dart';
import 'package:flutter_google_books/common/typedef/search_list_args.dart';
import 'package:flutter_google_books/common/widgets/error_widget.dart';
import 'package:flutter_google_books/search_list_page/widgets/book_list_tile.dart';

class SearchListPage extends StatelessWidget {
  const SearchListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SearchListArgs;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Search Page',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: FutureBuilder(
            future: searchType(args),
            builder: (context, snapshot) {
              if (snapshot.hasData) return _listViewGenerator(snapshot.data);

              if (snapshot.hasError) {
                return ErrorText(errorMessage: snapshot.error.toString());
              }

              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _listViewGenerator(Result? result) {
    if (result == null || result.items.isNullOrEmpty) {
      const ErrorText(errorMessage: 'Nessun risultato trovato!');
    }

    return ListView.separated(
      itemBuilder: (context, index) => BookListTile(
        volumeInfo: result.items![index].volumeInfo!,
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: result!.items!.length,
    );
  }
}

Future<Result?> searchType(SearchListArgs args) async {
  final client = Client();

  if (args.isCategory) {
    return client.searchByCategory(args.value);
  }

  return client.searchByValue(args.value);
}
