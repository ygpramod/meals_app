import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filters, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

enum Filters {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _vegetarianFilter = false;
  bool _veganFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filters.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filters.lactoseFree]!;
    _vegetarianFilter = widget.currentFilters[Filters.vegetarian]!;
    _veganFilter = widget.currentFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filters.glutenFree: _glutenFreeFilter,
            Filters.lactoseFree: _lactoseFreeFilter,
            Filters.vegetarian: _vegetarianFilter,
            Filters.vegan: _veganFilter,
          });
          return false;
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
