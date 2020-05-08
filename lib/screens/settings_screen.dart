import 'package:flutter/material.dart';
import 'package:recipe/screens/main_drawer.dart';
import 'package:recipe/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) settingsChanged;
  SettingsScreen(this.settings, this.settingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {  

  Settings settings;

  @override
  void initState() {
    super.initState();
    this.settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.settingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
      ),
      drawer: DrawerMain(),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: _createSwitch(
              "Sem Glutén",
              "Só mostra comida sem glutén",
              settings.isGluttenFree,
              (value) => setState(() => settings.isGluttenFree = value),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: _createSwitch(
              "Sem Lactose",
              "Só mostra comida sem lactose",
              settings.isLactoseFree,
              (value) => setState(() => settings.isLactoseFree = value),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: _createSwitch(
              "Vegana",
              "Só mostra comida Vegana",
              settings.isVegan,
              (value) => setState(() => settings.isVegan = value),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: _createSwitch(
              "Vegetariana",
              "Só mostra comida vegetariana",
              settings.isVegeterian,
              (value) => setState(() => settings.isVegeterian = value),
            ),
          ),
        ],
      ),
    );
  }
}
