import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> filters;
  FiltersScreen(this.filters, this.setFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['glutenFree'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactoseFree'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subTitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  'glutenFree': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactoseFree': _lactoseFree,
                };

                widget.setFilters(selectedFilter);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile('Gluten-Free',
                      'Only Include Gluten Free Meal', _glutenFree, (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Is Vegan', 'Only Include Vegan Meal', _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Vegetarian', 'Only include Vegetarian Meal', _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
                  _buildSwitchListTile(
                      'Lactose-Free', 'Only Include Lactose-Free', _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
                ],
              ),
            ),
          ],
        ));
  }
}
