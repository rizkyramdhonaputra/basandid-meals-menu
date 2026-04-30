// ignore_for_file: prefer_final_parameters

import 'package:aplikasi_menumakanan/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const ProviderScope(child: MenuApps()));
}

class MenuApps extends StatelessWidget {
  const MenuApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsScreen(),
      theme: theme,
      title: 'Aplikasi Menu Makanan',
    );
  }
}
