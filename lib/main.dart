// ignore_for_file: prefer_final_parameters

import 'package:aplikasi_menumakanan/screens/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MenuApps());
}

class MenuApps extends StatelessWidget {
  const MenuApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CategoryScreen(), theme: theme, title: 'Aplikasi Menu Makanan');
  }
}
