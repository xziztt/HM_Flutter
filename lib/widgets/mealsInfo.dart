import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';
import '../models/ordered_list.dart';
import 'package:toast/toast.dart';
import './drawer.dart';

class MealsInfo extends StatelessWidget {
  final List<Meal> orderedMealId;
  MealsInfo(this.orderedMealId);

  static const routeName = '/meals-info';
  Widget buildTitle(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
    );
  }

  void ordered(String id) {
    orderedMealId.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
    print(orderedMealId.last.title);
    print(orderedMealId.length);
    print("Ordered succesfully");
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 500,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) =>
        element.id == id); //returns the first value where the condition is true

    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: FittedBox(fit: BoxFit.fitWidth, child: Text(selectedMeal.title)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 260,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildTitle('Ingredients'),
            SizedBox(
              height: 20,
            ),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.black,
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                ordered(selectedMeal.id);
                Toast.show("Order Added", context,
                    backgroundColor: Colors.white10,
                    duration: Toast.LENGTH_LONG,
                    gravity: Toast.BOTTOM);
              },
              elevation: 5,
            )
          ],
        ),
      ),
    );
  }
}
