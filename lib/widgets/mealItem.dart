import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'mealsInfo.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeItem;
  MealItem(this.id, this.title, this.imageUrl, this.duration,
      this.affordability, this.complexity, this.removeItem);

  String get getComplexity {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
    }
  }

  String get getAffordability {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    void selectMeal(BuildContext context) {
      Navigator.of(context)
          .pushNamed(MealsInfo.routeName, arguments: id)
          .then((value) {
        if (value != null) {
          removeItem(value);
        }
      });
    }

    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    color: Colors.black45,
                    width: 250,
                    height: 50,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '$duration minutes',
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '$getComplexity',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(children: <Widget>[
                    Icon(Icons.monetization_on),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '$getAffordability',
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
