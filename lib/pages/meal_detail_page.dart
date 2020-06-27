import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDetailPage extends StatelessWidget {
  static const routeName = '/meal-detail/';
  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Center(
        child: Text(meal.id),
      ),
    );
  }
}
