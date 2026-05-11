import 'package:aplikasi_menumakanan/providers/favorites_provider.dart';
import 'package:aplikasi_menumakanan/screens/category_screen.dart';
import 'package:aplikasi_menumakanan/screens/filters_screen.dart';
import 'package:aplikasi_menumakanan/screens/meals_screen.dart';
import 'package:aplikasi_menumakanan/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_menumakanan/providers/filters_provider.dart';

const kInitialFilters = {
  Filters.gluttenFree: false,
  Filters.lactoseFree: false,
  Filters.vegetarian: false,
  Filters.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _selectScreen(String menuCode) async {
    Navigator.of(context).pop();
    if (menuCode == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(builder: (ctx) => const FiltersScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoryScreen(
      availableMeals: availableMeals,
    ); //default page
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealsProvider);
      activePage = MealsScreen(listMeals: favoriteMeals);
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _selectScreen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.dining),
            label: 'Categories',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
      body: activePage,
    );
  }
}
