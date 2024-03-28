import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/categories.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme:
        ColorScheme.fromSeed(seedColor: Color.fromARGB(92, 151, 49, 9)));
// ThemeData detaylıca araştır.
void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: theme,
        home: const Categories(),
      ),
    ),
  );
}
