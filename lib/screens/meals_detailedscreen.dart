import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:flutter/material.dart';

class MealsDetailedscreen extends StatelessWidget {
  const MealsDetailedscreen({super.key, required this.meal});

  final Meals meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(ingredient, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 14),
            Text('Steps', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Text(step, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
