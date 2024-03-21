import 'package:flutter/material.dart';
import 'package:mealsapp/widgets/category_card.dart';

// Global State - Global State Management
class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "Kategori 1",
      "Kategori 2",
      "Kategori 3",
      "Kategori 4"
    ];
    // Kategoriler model olarak data dosyasından gelmeli.
    return Scaffold(
      appBar: AppBar(title: const Text("Kategoriler")),
      // Inkwell, GestureDetector
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 25,
            mainAxisSpacing: 5,
            childAspectRatio: 4 / 2),
        children: categories.map((e) => CategoryCard()).toList(),
      ),
    );
  }
}
