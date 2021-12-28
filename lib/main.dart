
import 'package:flutter/material.dart';

import './screens/meal_detail_screen.dart';
import './dummy_data.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screens.dart';
import './screens/filters_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favourites = [];

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      _filter = filters;

      _availableMeals = DUMMY_MEALS.where((element) {
        if((_filter['gluten'] ?? false) && !element.isGlutenFree) return false;
        if((_filter['lactose'] ?? false) && !element.isLactoseFree) return false;
        if((_filter['vegan'] ?? false) && !element.isVegan) return false;
        if((_filter['vegetarian'] ?? false) && !element.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealID) {
    final existingIndex = _favourites.indexWhere((element) => element.id == mealID);
    if(existingIndex >= 0) {
      setState(() {
        _favourites.removeAt(existingIndex);
      });
    }
    else {
      setState(() {
        _favourites.add(
          DUMMY_MEALS.firstWhere((element) => element.id == mealID)
        );
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    return _favourites.any((element) => element.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: const TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: const TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          )
        )
      ),
      routes: {
        '/': (ctx) => TabsScreen(_favourites),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavourite,_isMealFavourite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filter,_setFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}