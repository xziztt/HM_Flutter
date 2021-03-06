import 'package:flutter/material.dart';
import 'package:mealsApp/itemsStuff/addNewItem.dart';
import 'package:mealsApp/managerStuff/add_employees.dart';
import 'package:mealsApp/managerStuff/delete_employees.dart';
import 'package:mealsApp/managerStuff/display_customers.dart';
import 'package:mealsApp/managerStuff/display_employees.dart';

class ManagerOptions extends StatelessWidget {
  static final routeName = "/manager-options";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("MANAGER OPTIONS"),
      ),
      body: Center(
        child: Column(
          children: [
            FlatButton(
                color: Colors.white,
                child: Text("VIEW EMPLOYEES"),
                onPressed: () {
                  Navigator.of(context).pushNamed(DisplayEmployees.routeName);
                }),
            FlatButton(
              color: Colors.white,
              child: Text("ADD EMPLOYEES"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AddEmployees.routeName),
            ),
            FlatButton(
              color: Colors.white,
              child: Text("DELETE EMPLOYEES"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(DeleteEmployees.routeName),
            ),
            FlatButton(
              color: Colors.white,
              child: Text("ADD ITEMS"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(AddNewItem.routeName),
            ),
             FlatButton(
              color: Colors.white,
              child: Text("CUSTOMER LIST"),
              onPressed: () =>
                  Navigator.of(context).pushNamed(DisplayCustomers.routeName),
            )
          ],
        ),
      ),
    );
  }
}
