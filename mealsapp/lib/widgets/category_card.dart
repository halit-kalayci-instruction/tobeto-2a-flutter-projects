import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  // Dışarıdan alınan kategori modeli rengi ve ismi ile bu kartta kullanılmalı.
  // onTap aksiyonu, dışardan aldığı fonksiyonu haberdar etmeli.
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Kategoriye tıklandı");
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.orange.withOpacity(0.7),
              Colors.orange.withOpacity(0.3)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16.0),
        child: const Text("Kategori 1"),
      ),
    );
  }
}
