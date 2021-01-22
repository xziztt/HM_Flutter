import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mealsApp/models/ordered_list.dart';
import 'package:mealsApp/screens/orderConfirmed.dart';
import 'package:mealsApp/widgets/ordered_screen.dart';

String username = '';

class SubmitCustomer extends StatefulWidget {
  static final routeName = '/submit-customer';
  @override
  _SubmitCustomerState createState() => _SubmitCustomerState();
}

class _SubmitCustomerState extends State<SubmitCustomer> {
  TextEditingController name = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController eid = new TextEditingController();

  Future<List> senddata(orderId, totalPrice) async {
    String orderIdString = orderId.toString();
    print("req");

    await http.post("http://192.168.29.232/php_flutter/insertdata.php", body: {
      "cid": orderIdString,
      "name": name.text,
      "email": email.text,
      "phno": mobile.text,
      "total": totalPrice.toString(),
      "eid": eid.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<num> args = ModalRoute.of(context).settings.arguments;
    int orderId = args[1];
    double totalPrice = args[0];
    print(args[0]);
    //print(totalPrice);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(orderId.toString()),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Employee ID",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: eid,
                decoration: InputDecoration(hintText: 'Employee ID'),
              ),
              Text(
                "Username",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'name'),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              Text(
                "Mobile",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: mobile,
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              RaisedButton(
                child: Text("Confirm Order"),
                onPressed: () {
                  senddata(orderId, totalPrice);
                  orderId += 1;
                  Navigator.of(context)
                      .pushReplacementNamed('/order-confirmed');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
