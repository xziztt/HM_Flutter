import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mealsApp/models/ordered_list.dart';
import 'package:mealsApp/screens/orderConfirmed.dart';

String username = '';

class AddEmployees extends StatefulWidget {
  static final routeName = '/add-employees';
  @override
  _AddEmployeesState createState() => _AddEmployeesState();
}

class _AddEmployeesState extends State<AddEmployees> {
  TextEditingController id = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController addr = new TextEditingController();
  TextEditingController phno = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController age = new TextEditingController();

  Future<List> senddata() async {
    print("req");

    await http.post("http://192.168.29.232/php_flutter/input_employees.php",
        body: <String, String>{
          "eid": id.text,
          "name": name.text,
          "age": age.text,
          "addr": addr.text,
          "phno": phno.text,
          "salary": salary.text,
        });
  }

  @override
  Widget build(BuildContext context) {
    int orderId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ADD EMPLOYEE"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Employee id",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: id,
                decoration: InputDecoration(hintText: 'ID'),
              ),
              Text(
                "Employee Name",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              Text(
                "Age",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: age,
                decoration: InputDecoration(hintText: 'age'),
                keyboardType: TextInputType.number,
              ),
              Text(
                "Employee Address",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: addr,
                decoration: InputDecoration(hintText: 'Address'),
              ),
              Text(
                "Phone No",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: phno,
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
              Text(
                "Salary",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: salary,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Salary'),
              ),
              RaisedButton(
                child: Text("ADD EMPLOYEE"),
                onPressed: () {
                  senddata();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
