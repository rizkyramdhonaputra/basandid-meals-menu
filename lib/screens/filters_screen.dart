// import 'package:aplikasi_menumakanan/screens/tabs_screen.dart';
// import 'package:aplikasi_menumakanan/widgets/main_drawer.dart';
import 'package:aplikasi_menumakanan/widgets/switchlist_item.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_menumakanan/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          SwitchlistItem(
            switchValue: activeFilters[Filters.gluttenFree]!,
            onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filters.gluttenFree, isChecked),
            title: 'Gluten-Free',
            subtitle: 'Only include gluten-free meals',
          ),
          SwitchlistItem(
            switchValue: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filters.lactoseFree, isChecked),
            title: 'Lactose-Free',
            subtitle: 'Only include lactose-free meals',
          ),
          SwitchlistItem(
            switchValue: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filters.vegan, isChecked),
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
          ),
          SwitchlistItem(
            switchValue: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) => ref.read(filtersProvider.notifier).setFilter(Filters.vegetarian, isChecked),
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
          ),
        ],
      ),
    );
  }
}
