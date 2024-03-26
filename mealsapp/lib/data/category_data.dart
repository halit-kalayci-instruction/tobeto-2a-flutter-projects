import 'package:flutter/material.dart';
import 'package:mealsapp/models/category.dart';

// TODO: Use guid package
const categories = [
  Category(id: "1", name: "Başlangıçlar", color: Colors.purple),
  Category(id: "2", name: "Ara Sıcaklar", color: Colors.red),
  Category(id: "3", name: "Ana Yemekler", color: Colors.blue),
  Category(id: "4", name: "Tatlılar", color: Colors.lime)
];

// BİREYSEL ARAŞTIRMA => Flutter Provider

// Meal_details ekranını tasarlayalım.