import "package:flutter/material.dart";
import 'package:recipe/models/category.dart';
import 'package:recipe/data/dummy_data.dart';
import 'package:recipe/components/meal_item.dart';

class CategorieMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorie = ModalRoute.of(context).settings.arguments as Category;
    final categorieMeals = DUMMY_MEALS.where((meal) {
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
