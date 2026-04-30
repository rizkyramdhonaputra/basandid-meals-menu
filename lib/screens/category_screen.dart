import 'package:aplikasi_menumakanan/data/dummy_data.dart';
import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:aplikasi_menumakanan/screens/meals_screen.dart';
import 'package:aplikasi_menumakanan/widgets/category_griditem.dart';
import 'package:aplikasi_menumakanan/models/category_models.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.availableMeals});

  final List<Meals> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals =
        availableMeals
            .where((meal) => meal.category.contains(category.id))
            .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (ctx) => MealsScreen(
              title: category.title,
              listMeals: filteredMeals,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in dummyCategories)
          CategoryGriditem(
            key: ValueKey(category.id),
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
