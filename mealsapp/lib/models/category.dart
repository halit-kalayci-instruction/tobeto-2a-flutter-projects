import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.id, required this.name, this.color = Colors.orange});

  final String id; // Identifier => Kimlik belirleyiciler
  // int, String => 1,2,3,4,5,6,7
  // String => Guid
  final String name;
  final Color color;
}
