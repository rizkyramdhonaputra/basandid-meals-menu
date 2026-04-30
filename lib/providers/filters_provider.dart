import 'package:aplikasi_menumakanan/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

enum Filters { gluttenFree, lactoseFree, vegan, vegetarian }

class FiltersNotifier extends StateNotifier<Map<Filters, bool>> {
  FiltersNotifier()
    : super({
        Filters.gluttenFree: false,
        Filters.lactoseFree: false,
        Filters.vegan: false,
        Filters.vegetarian: false,
      });

  void setFilters(Map<Filters, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filters filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    }; // state[filter] = isActive; // This would not work because state is immutable
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filters, bool>>(
      (ref) => FiltersNotifier(),
    );

final filteredMealsProvider = Provider((ref) {
  final mealData = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);

  return mealData.where((meal) {
      if (selectedFilters[Filters.gluttenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filters.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});