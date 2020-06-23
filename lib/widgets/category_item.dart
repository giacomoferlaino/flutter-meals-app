import 'package:flutter/material.dart';

import '../pages/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String _id;
  final String _title;
  final Color _color;

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/category-meals',
      arguments: {
        'id': _id,
        'title': _title,
      },
    );
  }

  const CategoryItem(this._id, this._title, this._color);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_color.withOpacity(0.5), _color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
