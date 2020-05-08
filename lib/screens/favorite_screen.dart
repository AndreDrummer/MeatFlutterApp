import 'package:flutter/material.dart';
import 'package:recipe/components/meal_item.dart';
import "package:recipe/models/meal.dart";

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text("Nenhuma refeição adicionada como favorita!"),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (_, index) {
          return MealItem(favoriteMeals[index]);
        },
      );
    }
  }
}
