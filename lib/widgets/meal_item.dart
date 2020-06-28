import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../pages/meal_detail_page.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  // final Function removeItem;

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailPage.routeName,
      arguments: meal,
    )
        .then((result) {
      if (result != null) {
        // removeItem(result);
      }
    });
  }

  MealItem(this.meal);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: const Radius.circular(15),
                      topRight: const Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black54,
                      ),
                      child: Text(
                        meal.title,
                        style: const TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.duration} min'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text('${meal.complexityText}'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        Text('${meal.affordabilityText}'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
