import 'package:aplikasi_menumakanan/data/dummy_data.dart';
import 'package:aplikasi_menumakanan/widgets/category_griditem.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Makanan'),
      ),
      body: GridView(
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
          ),          
        ],
      ),
    );
  }
}
