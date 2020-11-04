import 'package:flutter/material.dart';
import '../models/category.dart';
import 'favourite_screen.dart';
import 'drawer.dart';
import 'categoryHome.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> Screens = [CategoriesHome(), FavouritesScreen()];
  int _selectedIndex = 0;
  Widget _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recipes'),
      ),
      drawer: MainDrawer(),
      body: Screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        elevation: 10,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.favorite),
            title: Text("Favorites"),
          )
        ],
      ),
    );
  }
}
