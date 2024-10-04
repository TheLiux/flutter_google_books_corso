import 'package:flutter/material.dart';
import 'package:flutter_google_books/common/models/category.dart';
import 'package:flutter_google_books/home_page/widgets/category_card.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: _items.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          category: _items[index],
        );
      },
      separatorBuilder: (_,__)=> const SizedBox(width: 20,),
    );
  }

  final List<Category> _items = [
    Category(
      icon: Icons.history_edu,
      iconColor: Colors.amber,
      title: "Storia",
      description: "Per chi è amante della storia",
      parameter: 'history',
    ),
    Category(
      icon: Icons.castle,
      iconColor: Colors.grey,
      title: "Fantasy",
      description: "Per chi è amante del fantasy",
      parameter: 'fantasy',
    ),
    Category(
      icon: Icons.rocket_launch,
      iconColor: Colors.red,
      title: "Avventura",
      description: "Per chi è amante dell'avventura",
      parameter: 'adventure',
    ),
    Category(
      icon: Icons.wordpress_rounded,
      iconColor: Colors.lightBlueAccent,
      title: "Horror",
      description: "Per chi è amante dell'orrore",
      parameter: 'horror',
    ),
    Category(
      icon: Icons.local_pharmacy,
      iconColor: Colors.redAccent,
      title: "Medicina",
      description: "Per chi è amante della medicina",
      parameter: 'medical',
    ),
  ];
}
