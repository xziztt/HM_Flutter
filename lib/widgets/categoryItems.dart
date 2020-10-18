import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummydata.dart';
import 'itemsScreen.dart';

class CategoryItems extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  CategoryItems(this.id, this.title, this.color);
  void goToCategory(BuildContext context) {
    Navigator.of(context).pushNamed(PerCategory.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToCategory(context),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.6), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
    );
  }
}
