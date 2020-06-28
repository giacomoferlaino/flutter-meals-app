import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/favorites_page.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsPage extends StatefulWidget {
  static const routeName = '/';

  final List<Meal> favoriteMeals;

  TabsPage(this.favoriteMeals);

  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      {
        'page': CategoriesPage(),
        'title': 'Categories',
      },
      {
        'page': FavoritesPage(widget.favoriteMeals),
        'title': 'Favorites',
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}
