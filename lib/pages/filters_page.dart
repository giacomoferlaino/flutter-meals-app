import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersPageState createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function onChanged}) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: currentValue,
      onChanged: (value) {
        setState(() {
          onChanged(value);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    title: 'Gluten-free',
                    description: 'Only include gluten-free meals.',
                    currentValue: _glutenFree,
                    onChanged: (newValue) {
                      _glutenFree = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals.',
                    currentValue: _vegetarian,
                    onChanged: (newValue) {
                      _vegetarian = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Vegan',
                    description: 'Only include vegan meals.',
                    currentValue: _vegan,
                    onChanged: (newValue) {
                      _vegan = newValue;
                    },
                  ),
                  _buildSwitchListTile(
                    title: 'Lactose-free',
                    description: 'Only include lactose-free meals.',
                    currentValue: _lactoseFree,
                    onChanged: (newValue) {
                      _lactoseFree = newValue;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
