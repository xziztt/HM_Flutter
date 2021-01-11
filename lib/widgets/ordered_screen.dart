import 'package:flutter/material.dart';
import '../models/ordered_list.dart';
import './order_list_builder.dart';
import '../models/meal.dart';
import '../submissionScreens/submitCustomerInfo.dart';

class OrderedScreen extends StatefulWidget {
  final List<Meal> orderedMeals;
  OrderedScreen(this.orderedMeals);

  double addItems() {
    double sum = 0;
    orderedMeals.map((e) => sum += e.price);
    print(sum);
    return sum;
  }

  double _calculateTotal() {
   // print("calculate price called");
    double totalPrice = 0;
   // print(orderedMeals[0].title);
    for (int i = 0; i < orderedMeals.length; i++) {
      totalPrice += orderedMeals[i].price;
    }
   // print(totalPrice);
    return totalPrice;
  }

  static const routeName = "/ordered-screen";

  @override
  _OrderedScreenState createState() => _OrderedScreenState();
}

class _OrderedScreenState extends State<OrderedScreen> {
  @override
  Widget build(BuildContext context) {
    int orderId = 0;
    return Scaffold(
      appBar: AppBar(
        actions: [
          RaisedButton(
            color: Colors.red,
            child: Row(
              children: [
                Text(
                  "CONFIRM ORDER",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            onPressed: () {
              orderId += 1;
              double totalPrice = widget._calculateTotal();
              Navigator.of(context).pushNamed(
                SubmitCustomer.routeName,
                arguments: [totalPrice, orderId],
              );
            },
          )
        ],
        title: Text("ORDERS"),
      ),
      body: widget.orderedMeals.isEmpty
          ? Center(
              child: Container(
                child: Text(
                  "NO ORDERS YET",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return OrderedListBuilder(
                  widget.orderedMeals[index].id,
                  widget.orderedMeals[index].title,
                  widget.orderedMeals[index].imageUrl,
                  widget.orderedMeals[index].price,
                  widget.orderedMeals,
                );
              },
              itemCount: widget.orderedMeals.length,
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(
            () {
              widget.orderedMeals.clear();
              print(widget.orderedMeals.length);
            },
          );
        },
      ),
    );
  }
}
