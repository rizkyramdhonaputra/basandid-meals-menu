import 'package:aplikasi_menumakanan/data/dummy_data.dart';
import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:aplikasi_menumakanan/screens/meals_detailedscreen.dart';
import 'package:aplikasi_menumakanan/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.listMeals, required this.onToggleFavorite});

  final String? title;
  final List<Meals> listMeals;
   final void Function(Meals meal) onToggleFavorite;

  void _selectMeal(BuildContext context, Meals meal) {
    final selectedMeal = dummyMeals.singleWhere((m) => m.id == meal.id);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsDetailedscreen(meal: selectedMeal, onToggleFavorite: onToggleFavorite,),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No meals found!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );

    if (listMeals.isNotEmpty) {
      content = ListView.builder(
        itemCount: listMeals.length,
        itemBuilder: (ctx, index) => MealItem(meal: listMeals[index], onSelectMeal: () => _selectMeal(context, listMeals[index]),),
      );
    }
    
    if (title == null) {
      return content;
    }
    return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
  }
}
