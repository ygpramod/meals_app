import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key});
  
  @override
  ConsumerState<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  void initState() {
    super.initState();
    var activeFilters = ref.read(filtersProvider);
    _glutenFreeFilter = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilter = activeFilters[Filter.vegetarian]!;
    _veganFilter = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter,
          });
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (onChanged) {
                setState(() {
                  _glutenFreeFilter = onChanged;
                });
              },
              title: buildTitle(context, 'Gluten-Free'),
              subtitle:
                  buildSubTitle(context, 'Only include gluten free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (onChanged) {
                setState(() {
                  _lactoseFreeFilter = onChanged;
                });
              },
              title: buildTitle(context, 'Lactose-Free'),
              subtitle:
                  buildSubTitle(context, 'Only include lactose free meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (onChanged) {
                setState(() {
                  _vegetarianFilter = onChanged;
                });
              },
              title: buildTitle(context, 'Vegetarian'),
              subtitle: buildSubTitle(context, 'Only include vegetarian meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (onChanged) {
                setState(() {
                  _veganFilter = onChanged;
                });
              },
              title: buildTitle(context, 'Vegan'),
              subtitle: buildSubTitle(context, 'Only include vegan meals'),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }

  Text buildTitle(BuildContext context, String text) => Text(text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ));

  Text buildSubTitle(BuildContext context, String text) => Text(text,
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ));
}
