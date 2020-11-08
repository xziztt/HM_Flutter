import 'package:flutter/material.dart';
import '../models/ordered_list.dart';
import './order_list_builder.dart';
import '../models/meal.dart';
import '../submissionScreens/submitCustomerInfo.dart';

class OrderedScreen extends StatelessWidget {
  final List<Meal> orderedMeals;
  OrderedScreen(this.orderedMeals);

  static const routeName = "/ordered-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            RaisedButton(
              color: Colors.white,
              child: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(SubmitCustomer.routeName),
            )
          ],
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
