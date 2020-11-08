import 'package:flutter/material.dart';

Widget buildListTile(String title, IconData icon, Function tapFunction) {
  return ListTile(
    leading: Icon(
      icon,
      color: Colors.white,
      size: 30,
    ),
    title: Text(
      title,
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
    onTap: tapFunction,
  );
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            alignment: Alignment.center,
            height: 100,
            child: Text(
              "OPTIONS",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          buildListTile(
            "Recipes",
            Icons.restaurant,
            () {
              Navigator.of(context).pushNamed("/");
            },
          ),
          buildListTile(
            "Filters",
            Icons.settings,
            () {
              Navigator.of(context).pushNamed("/filters");
            },
          ),
          buildListTile(
            "Orders",
            Icons.food_bank,
            () {
              Navigator.of(context).pushNamed("/ordered-screen");
            },
          ),
          buildListTile(
            "Manager Login",
            Icons.food_bank,
            () {
              Navigator.of(context).pushNamed("/ordered-screen");
            },
          ),
        ],
      ),
    );
  }
}
