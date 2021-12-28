import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  Map<String, bool> filters;
  Function saveFilters;

  FiltersScreen(this.filters,this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] ?? false;
    _lactoseFree = widget.filters['lactose'] ?? false;
    _vegan = widget.filters['vegan'] ?? false;
    _vegetarian = widget.filters['vegetarian'] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: ()
              {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save),
          ),
        ],
        title: const Text(
            "Filters",
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                      title: Text("Gluten-Free"),
                      subtitle: Text("Only gluten free meals will be included."),
                      value: _glutenFree,
                      onChanged: (newVal) {
                        setState(() {
                          _glutenFree = newVal;
                        });
                      }
                  ),
                  SwitchListTile(
                      title: Text("Lactose-Free"),
                      subtitle: Text("Only lactose free meals will be included."),
                      value: _lactoseFree,
                      onChanged: (newVal) {
                        setState(() {
                          _lactoseFree = newVal;
                        });
                      }
                  ),
                  SwitchListTile(
                      title: Text("Vegetarian"),
                      subtitle: Text("Only vegetarian meals will be included."),
                      value: _vegetarian,
                      onChanged: (newVal) {
                        setState(() {
                          _vegetarian = newVal;
                        });
                      }
                  ),
                  SwitchListTile(
                      title: Text("Vegan"),
                      subtitle: Text("Only vegan meals will be included."),
                      value: _vegan,
                      onChanged: (newVal) {
                        setState(() {
                          _vegan = newVal;
                        });
                      }
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
