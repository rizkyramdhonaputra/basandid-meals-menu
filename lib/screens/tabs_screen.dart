import 'package:aplikasi_menumakanan/models/meals_models.dart';
import 'package:aplikasi_menumakanan/screens/category_screen.dart';
import 'package:aplikasi_menumakanan/screens/meals_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meals> _favoriteMeals = [];

  void _toggleFavorite(Meals meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoryScreen(onToggleFavorite: _toggleFavorite);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        listMeals: _favoriteMeals,
        onToggleFavorite: _toggleFavorite,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      body: activePage,
    );
  }
}
