import 'package:aplikasi_menumakanan/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:aplikasi_menumakanan/models/category_models.dart';
import 'package:aplikasi_menumakanan/widgets/category_griditem.dart';

//@Preview(name: 'Preview Widget')
Widget previewWidget () {
  return CategoryGriditem(
    category: Category(
      id: 'c1',
      title: 'Makanan',
      color: Colors.orange,
    ),
    onSelectCategory: () {},
  );
}

@Preview(name: 'Preview Screen')
Widget previewScreen () {
  return MaterialApp(home: CategoryScreen(), theme: ThemeData(), title: 'Aplikasi Menu Makanan');
}