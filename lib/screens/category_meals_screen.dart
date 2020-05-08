import "package:flutter/material.dart";
import 'package:recipe/models/category.dart';
import 'package:recipe/models/meal.dart';
import 'package:recipe/components/meal_item.dart';

class CategorieMealsScreen extends StatelessWidget {  

  final List<Meal> meals;

  const CategorieMealsScreen(this.meals);

  @override
  Widget build(BuildContext context) {
    final categorie = ModalRoute.of(context).settings.arguments as Category;
    final categorieMeals = meals.where((meal) {
      return meal.categories.contains(categorie.id);
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(categorie.title)),
        body: ListView.builder(
          itemCount: categorieMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categorieMeals[index]);
          },
        ));
  }
}
