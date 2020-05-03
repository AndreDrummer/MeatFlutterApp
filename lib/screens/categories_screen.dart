import 'package:flutter/material.dart';
import 'package:recipe/data/dummy_data.dart';

import "../components/categories_item.dart";

class CategorieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vamos cozinhar?")
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoriesItem(cat);
          }).toList()),
    );
  }
}
