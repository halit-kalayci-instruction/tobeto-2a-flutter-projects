// 2 Yapı

// Notifier - Provider

// Notifier => Dışardan aldığı aksiyonla depoyu değiştiren mekanizma

// Provider => Depoyu dış dünyaya açan mekanizma

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  void toggleMealFavorite(Meal meal) {
    // deponun verisine ulaşmak

    // State is immutable
    if (state.contains(meal)) {
      //state.remove(meal);
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      //state.add(meal);
      // list1 [1,2,3,4]
      // list2 [ ...list1, 5, 6 ]
      state = [...state, meal];
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier());
