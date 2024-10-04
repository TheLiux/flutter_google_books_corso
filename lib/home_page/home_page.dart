import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_google_books/common/typedef/search_list_args.dart';
import 'package:flutter_google_books/common/widgets/custom_app_bar.dart';
import 'package:flutter_google_books/home_page/widgets/categories.dart';
import 'package:flutter_google_books/home_page/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Flutter Google Books",
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchBar(
                onSubmitted: (context, value) => _navigateToSearchPage(context, value),
                controller: controller,
              ),
              const SizedBox(height: 20),
              SizedBox(height: 42, child: Categories()),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context, String value) {
    if (value.isEmpty) {
      return;
    }

    final SearchListArgs args = (value: value, isCategory: false);

    Navigator.of(context).pushNamed('/search_list_page', arguments: args);
  }
}
