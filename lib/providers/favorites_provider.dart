import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:flutter_riverpod/legacy.dart';

class FavoritesMealsNotifier extends StateNotifier<List<Meals>>{
    FavoritesMealsNotifier(): super([]);

    bool toggleFavoriteMeal(Meals meal){
      final mealIsFavorite = state.contains(meal);
      if(mealIsFavorite){
        state = state.where((element) => element.id != meal.id).toList();
        return false; // Meal removed from favorites
      }else{
        state = [...state, meal];
        return true; // Meal added to favorites
      }
    }
}

final favoritesMealsProvider = StateNotifierProvider<FavoritesMealsNotifier, List<Meals>>((ref) {
  return FavoritesMealsNotifier();
});