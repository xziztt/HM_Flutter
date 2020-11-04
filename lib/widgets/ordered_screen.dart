import 'package:flutter/material.dart';
import '../models/ordered_list.dart';
import './order_list_builder.dart';
import '../models/meal.dart';

class OrderedScreen extends StatelessWidget {
  final List<Meal> orderedMeals;
  OrderedScreen(this.orderedMeals);

  static const routeName = "/ordered-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ORDERS"),
        ),
        body: orderedMeals.isEmpty
            ? Center(
                child: Container(
                    child: Text("NO ORDERS YET",
                        style: TextStyle(
                          color: Colors.white,
                        ))))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return OrderedListBuilder(orderedMeals[index].id,
                      orderedMeals[index].title, orderedMeals[index].imageUrl);
                },
                itemCount: orderedMeals.length,
              ));
  }
}
