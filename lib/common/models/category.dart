import 'package:flutter/material.dart';

class Category {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String parameter;

  Category({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.parameter,
  });
}
