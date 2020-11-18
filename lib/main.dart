import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsApp/managerStuff/add_employees.dart';
import 'package:mealsApp/managerStuff/delete_employees.dart';
import 'package:mealsApp/managerStuff/managerOptions.dart';
import 'package:mealsApp/managerStuff/managerLogin.dart';
import 'package:mealsApp/screens/orderConfirmed.dart';
import 'package:mealsApp/managerStuff/display_employees.dart';
import './data/dummy_data.dart';

import './widgets/ordered_screen.dart';
import './widgets/itemsScreen.dart';
import './widgets/mealsInfo.dart';
import './widgets/tabs_screen.dart';
import './widgets/filters.dart';
import 'models/meal.dart';
import './submissionScreens/submitCustomerInfo.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, systemNavigationBarColor: Colors.black));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> orderedMeals = [];
  Map<String, bool> _filterValues = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };
  List<Meal> _availableMeals =
      DUMMY_MEALS; // initially we take the entire dummy_data as available meals
  void _setFilter(Map<String, bool> filterData) {
    setState(() {
      _filterValues = filterData;
      _availableMeals.where((eachMeal) {
        //return false if you dont wanna include an item
        if (!eachMeal.isGlutenFree && _filterValues["gluten"]) {
          return false;
        }
        if (!eachMeal.isLactoseFree && _filterValues["lactose"]) {
          return false;
        }
        if (!eachMeal.isVegan && _filterValues["vegan"]) {
          return false;
        }
        if (!eachMeal.isVegetarian && _filterValues["vegetarian"]) {
          return false;
        }
        return true;
      }).toList(); //tolist is needed as where returns an iterable and not a list
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foods',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.black,
          canvasColor: Colors.black,
          fontFamily: 'SourceCodePro',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1:
                  TextStyle(color: Colors.white, fontFamily: 'SourceCodePro'),
              title: TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
      home: TabsScreen(),
      initialRoute: '/',
      routes: {
        PerCategory.routeName: (context) => PerCategory(_availableMeals),
        MealsInfo.routeName: (context) => MealsInfo(orderedMeals),
        Filters.routeName: (context) => Filters(_setFilter, _filterValues),
        OrderedScreen.routeName: (context) => OrderedScreen(orderedMeals),
        SubmitCustomer.routeName: (context) => SubmitCustomer(),
        LoginPage.routeName: (context) => LoginPage(),
        DisplayEmployees.routeName: (context) => DisplayEmployees(),
        OrderConfirmed.routeName: (context) => OrderConfirmed(),
        ManagerOptions.routeName: (context) => ManagerOptions(),
        DeleteEmployees.routeName: (context) => DeleteEmployees(),
        AddEmployees.routeName: (context) => AddEmployees(),
      },
    );
  }
}
