import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './drawer.dart';
import './tabs_screen.dart';

class Filters extends StatefulWidget {
  final Function setFilter;
  Map<String, bool> filterValues;
  Filters(this.setFilter, this.filterValues);
  static const routeName = "/filters";

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var glutenFree = false;
  var vegetarian = false;
  var vegan = false;
  var lactoseFree = false;
  @override
  initState() {
    glutenFree = widget.filterValues["gluten"];
    vegetarian = widget.filterValues["vegetarian"];
    vegan = widget.filterValues["vegan"];
    lactoseFree = widget.filterValues["lactose"];

    super.initState();
  }

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
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> valuesPass = {
                  "gluten": glutenFree,
                  "lactose": lactoseFree,
                  "vegan": vegan,
                  "vegetarian": vegetarian,
                };
                widget.setFilter(valuesPass);
              })
        ],
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
