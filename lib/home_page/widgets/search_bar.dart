import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/typedef/void_callback_searchbar.dart';

class SearchBar extends StatelessWidget {
  final VoidCallbackSearchbar onSubmitted;
  final TextEditingController controller;

  const SearchBar({super.key, required this.onSubmitted, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) => onSubmitted(
        context,
        value.trim(),
      ),
      decoration: InputDecoration(
        labelText: "Cerca un libro",
        suffix: IconButton(
          onPressed: () => onSubmitted(
            context,
            controller.value.text.trim(),
          ),
          icon: const Icon(Icons.search),
        ),
      ),
      style: const TextStyle(),
    );
  }
}
