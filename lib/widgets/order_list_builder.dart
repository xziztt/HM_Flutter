import 'package:flutter/material.dart';
import 'package:mealsApp/models/meal.dart';

class OrderedListBuilder extends StatefulWidget {
  final String imgurl;
  final String id;
  final String title;
  final double price;
  final List<Meal> orderedList;

  OrderedListBuilder(
    this.id,
    this.title,
    this.imgurl,
    this.price,
    this.orderedList,
  );

  @override
  _OrderedListBuilderState createState() => _OrderedListBuilderState();
}

class _OrderedListBuilderState extends State<OrderedListBuilder> {
  @override
  Widget build(BuildContext context) {
    double sum;
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: Image.network(
                    widget.imgurl,
                    height: double.infinity,
                  ),
                ),
                SizedBox(width: 140),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 120,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "${widget.title.toUpperCase()}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Text(
                        "\$${widget.price.toString()}",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
