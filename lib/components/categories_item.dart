import "package:flutter/material.dart";
import 'package:recipe/utils/app_routes.dart';
import "../models/category.dart";

class CategoriesItem extends StatelessWidget {
  final Category categorie;

  const CategoriesItem(this.categorie);

  void _selectCategorie(BuildContext context) {
    Navigator.pushNamed(
      context,
      AppRoutes.CATEGORIE_MEALS,
      arguments: categorie,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategorie(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              this.categorie.color.withOpacity(0.5),
              this.categorie.color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          categorie.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
