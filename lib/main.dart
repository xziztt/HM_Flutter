import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsApp/widgets/categoryHome.dart';
import 'package:mealsApp/widgets/categoryItems.dart';
import 'package:mealsApp/widgets/itemsScreen.dart';
import 'package:mealsApp/widgets/mealsInfo.dart';
import 'package:mealsApp/widgets/tabs_screen.dart';
import 'package:mealsApp/widgets/filters.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, systemNavigationBarColor: Colors.black));
}

class MyApp extends StatelessWidget {
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
        PerCategory.routeName: (context) => PerCategory(),
        MealsInfo.routeName: (context) => MealsInfo(),
        Filters.routeName: (context) => Filters(),
      },
    );
  }
}
