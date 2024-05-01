import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
        (ref) => FiltersNotifier());

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          for (final item in Filter.values) item: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }

  void setFilters(Map<Filter, bool> filters){
    state = filters;
  }
}
