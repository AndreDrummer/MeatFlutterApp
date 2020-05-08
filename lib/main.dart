import 'package:flutter/material.dart';
import 'package:recipe/screens/settings_screen.dart';
import 'package:recipe/screens/tabs_screen.dart';
import 'package:recipe/screens/category_meals_screen.dart';
import "package:recipe/utils/app_routes.dart";
import 'package:recipe/screens/meal_details_screen.dart';
import "package:recipe/data/dummy_data.dart";
import 'package:recipe/models/settings.dart';
import 'package:recipe/models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avalaibleMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      _avalaibleMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGluttenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegeterian = settings.isVegeterian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegeterian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
        ? _favoriteMeals.remove(meal)
        : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6:
                  TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIE_MEALS: (_) => CategorieMealsScreen(_avalaibleMeals),
        AppRoutes.MEAL_DETAIL: (_) => MealDetail(_toggleFavorite, _isFavorite),
        AppRoutes.SETTINGS: (_) => SettingsScreen(settings, _filterMeals),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => TabsScreen(_favoriteMeals),
        );
      },
    );
  }
}
