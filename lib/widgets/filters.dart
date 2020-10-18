import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mealsApp/widgets/drawer.dart';
import 'tabs_screen.dart';

class Filters extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;
  Widget _buildSwitchTile(
      String title, var currentValue, Function updatedValue) {
    return SwitchListTile(
        activeColor: Colors.white,
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        value: currentValue,
        onChanged: updatedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Filters"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchTile("Gluten Free", glutenFree, (newValue) {
                setState(() {
                  glutenFree = newValue;
                });
              }),
              _buildSwitchTile("Lactose Free", lactoseFree, (newValue) {
                setState(() {
                  lactoseFree = newValue;
                });
              }),
              _buildSwitchTile("Vegetarian", vegetarian, (newValue) {
                setState(() {
                  vegetarian = newValue;
                });
              }),
              _buildSwitchTile("Lactose Free", vegan, (newValue) {
                setState(() {
                  vegan = newValue;
                });
              })
            ],
          ))
        ],
      ),
    );
  }
}
