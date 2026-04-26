// import 'package:aplikasi_menumakanan/screens/tabs_screen.dart';
// import 'package:aplikasi_menumakanan/widgets/main_drawer.dart';
import 'package:aplikasi_menumakanan/widgets/switchlist_item.dart';
import 'package:flutter/material.dart';

enum Filters { gluttenFree, lactoseFree, vegan, vegetarian }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluttenFreeFilterValue = false;
  _setGluttenFreeFilterValue(bool isChecked) {
    setState(() {
      _gluttenFreeFilterValue = isChecked;
    });
  }

  bool _lactoseFreeFilterValue = false;
  _setLactoseFreeFilterValue(bool isChecked) {
    setState(() {
      _lactoseFreeFilterValue = isChecked;
    });
  }

  bool _veganFilterValue = false;
  _setVeganFilterValue(bool isChecked) {
    setState(() {
      _veganFilterValue = isChecked;
    });
  }

  bool _vegetarianFilterValue = false;
  _setVegetarianFilterValue(bool isChecked) {
    setState(() {
      _vegetarianFilterValue = isChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(
      //         builder: (ctx) => const TabsScreen(),
      //       ),
      //     );
      //   }
      // }),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filters.gluttenFree: _gluttenFreeFilterValue,
            Filters.lactoseFree: _lactoseFreeFilterValue,
            Filters.vegan: _veganFilterValue,
            Filters.vegetarian: _vegetarianFilterValue,
          });
        },
        child: Column(
          children: [
            SwitchlistItem(
              switchValue: _gluttenFreeFilterValue,
              onChanged: _setGluttenFreeFilterValue,
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
            ),
            SwitchlistItem(
              switchValue: _lactoseFreeFilterValue,
              onChanged: _setLactoseFreeFilterValue,
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals',
            ),
            SwitchlistItem(
              switchValue: _veganFilterValue,
              onChanged: _setVeganFilterValue,
              title: 'Vegan',
              subtitle: 'Only include vegan meals',
            ),
            SwitchlistItem(
              switchValue: _vegetarianFilterValue,
              onChanged: _setVegetarianFilterValue,
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals',
            ),
          ],
        ),
      ),
    );
  }
}
