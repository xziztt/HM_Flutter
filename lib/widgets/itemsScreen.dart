import 'package:flutter/material.dart';
import './categoryItems.dart';
import '../data/dummy_data.dart';
import './mealItem.dart';
import '../models/meal.dart';

class PerCategory extends StatefulWidget {
  List<Meal> availableMeal;
  PerCategory(this.availableMeal);
  //final String id;
  //final String title;
  //PerCategory(this.id, this.title);
  static const routeName = '/items-screen';

  @override
  _PerCategoryState createState() => _PerCategoryState();
}

class _PerCategoryState extends State<PerCategory> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _isinit = false;
  @override
  void didChangeDependencies() {
    if (!_isinit) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryID = routeArgs['id'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryID);
      }).toList();
    }
    _isinit = true;

    super.didChangeDependencies();
  }

  void _removeItem(String id) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          title: Text(categoryTitle),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              displayedMeals[index].id,
              displayedMeals[index].title,
              displayedMeals[index].imageUrl,
              displayedMeals[index].duration,
              displayedMeals[index].affordability,
              displayedMeals[index].complexity,
              _removeItem);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
