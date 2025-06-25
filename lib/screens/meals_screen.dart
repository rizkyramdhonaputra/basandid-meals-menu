import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.listMeals});

  final String title;
  final List<Meals> listMeals;

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
          SizedBox(
            height: 20,
          ),
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
        itemBuilder: (ctx, index) {
          final meal = listMeals[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(meal.imageUrl)),
            title: Text(meal.title),
            subtitle: Text('${meal.duration} min'),
            onTap: () {
              // Navigate to meal details screen
            },
          );
        },
      );
    }

    return Scaffold(appBar: AppBar(title: Text(title)), body: content);
  }
}
