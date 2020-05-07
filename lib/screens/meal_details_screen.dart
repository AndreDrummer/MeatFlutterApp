import "package:flutter/material.dart";
import 'package:recipe/models/meal.dart';

class MealDetail extends StatelessWidget {
  Widget _generateTitle(BuildContext context, String title) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: Text(title, style: Theme.of(context).textTheme.title));
  }

  Widget _generateListView(context, child) {
    return Container(
        height: 240,
        width: 330,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 1,
            )),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text("${meal.title}"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _generateTitle(context, "Ingredientes"),
              _generateListView(
                context,
                ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (_, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(meal.ingredients[index]),
                      ),
                      color: Theme.of(context).accentColor,
                    );
                  },
                ),
              ),
              _generateTitle(context, "Passos"),
              _generateListView(
                context,
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (_, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}"),
                          ),
                          title: Text("${meal.steps[index]}"),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
