import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesPage extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesPage(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: const Text('You have not favorites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        Meal meal = _favoriteMeals[index];
        return MealItem(meal);
      },
      itemCount: _favoriteMeals.length,
    );
  }
}
