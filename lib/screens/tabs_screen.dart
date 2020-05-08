import "package:flutter/material.dart";
import "package:recipe/screens/categories_screen.dart";
import "package:recipe/screens/favorite_screen.dart";
import "package:recipe/screens/main_drawer.dart";

class TabsScreen extends StatefulWidget {
  final favoriteMeals;  
  const TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screen;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _screen = [
      {
        'title': 'Categorias',
        'screen': CategorieScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  void _selectedIndexScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text("${_screen[_selectedIndex]['title']}"),
            ),
            drawer: DrawerMain(),
            body: _screen[_selectedIndex]['screen'],
            bottomNavigationBar: BottomNavigationBar(
              onTap: _selectedIndexScreen,
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.category),
                  title: Text("Catgeoria"),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Theme.of(context).primaryColor,
                  icon: Icon(Icons.star),
                  title: Text("Favoritos"),
                )
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Theme.of(context).accentColor,
              unselectedItemColor: Colors.white,
            )));
  }
}
