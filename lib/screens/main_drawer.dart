import "package:flutter/material.dart";
import 'package:recipe/utils/app_routes.dart';

class DrawerMain extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'RobotoCondensed'),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            child: Text(
              "Vamos cozinhar?",
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            "Refeições",
            () => Navigator.pushReplacementNamed(context, AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            "Configurações",
            () => Navigator.pushReplacementNamed(context, AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
