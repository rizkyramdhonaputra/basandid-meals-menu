import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.listMeals});

  final String title;
  final List<Meals> listMeals;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: listMeals.length,
        itemBuilder: (context, index) {
          final meal = listMeals[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(meal.imageUrl),
            ),
            title: Text(meal.title),
            subtitle: Text('${meal.duration} minutes'),
            onTap: () {
              // Navigate to meal detail screen
            },
          );
        },
      ),
    );
  }
}