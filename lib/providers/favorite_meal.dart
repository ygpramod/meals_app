import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  return FavoriteMealsNotifier();
});

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    var favorite = state.contains(meal);
    if (favorite) {
      state = state.where((m) => meal.id != m.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}
