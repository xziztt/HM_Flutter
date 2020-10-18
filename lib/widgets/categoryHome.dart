import 'package:flutter/material.dart';
import 'package:mealsApp/data/dummydata.dart';
import 'package:mealsApp/widgets/categoryItems.dart';

class CategoriesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES
          .map((data) => CategoryItems(data.id, data.title, data.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 1.3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15),
    );
  }
}
