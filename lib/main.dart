import 'package:flutter/material.dart';
import 'package:recipe/screens/settings_screen.dart';
import 'package:recipe/screens/tabs_screen.dart';
import 'package:recipe/screens/category_meals_screen.dart';
import "package:recipe/utils/app_routes.dart";
import 'package:recipe/screens/meal_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              title: TextStyle(fontSize: 20, fontFamily: 'RobotoCondensed'))),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(),
        AppRoutes.CATEGORIE_MEALS: (_) => CategorieMealsScreen(),
        AppRoutes.MEAL_DETAIL: (_) => MealDetail(),
        AppRoutes.SETTINGS: (_) => SettingsScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(          
          builder: (_) => TabsScreen(),
        );
      },
    );
  }
}
