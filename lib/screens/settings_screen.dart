import 'package:flutter/material.dart';
import 'package:recipe/screens/main_drawer.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),      
      ),
      drawer: DrawerMain(),
      body: Center(
        child: Text("Configurações"),
      ),
    );
  }
}
