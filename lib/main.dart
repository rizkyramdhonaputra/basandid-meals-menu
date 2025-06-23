import 'package:aplikasi_menumakanan/screen/category_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MenuApps());
}

class MenuApps extends StatelessWidget {
  const MenuApps({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CategoryScreen(),
    );
  }
}