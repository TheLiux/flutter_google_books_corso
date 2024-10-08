import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/models/category.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearchPage(context, category.parameter),
      child: Chip(
        label: Center(
          child: Text(
            category.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        avatar: Icon(
          category.icon,
          color: category.iconColor,
        ),
      ),
    );
  }

  void _navigateToSearchPage(BuildContext context, String value) {
    final  args = (value: value, isCategory: true);

    context.push('/search_list_page', extra: args);
  }
}
