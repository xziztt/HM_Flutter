import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mealsApp/models/ordered_list.dart';
import 'package:mealsApp/screens/orderConfirmed.dart';

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

  Future<List> senddata(orderId) async {
    String orderIdString = orderId.toString();
    print("req");

    await http.post("http://192.168.29.232/php_flutter/insertdata.php",
        body: <String, String>{
          "cid": orderIdString,
          "name": name.text,
          "email": email.text,
          "phno": mobile.text,
          "eid": "temp",
        });
  }

  @override
  Widget build(BuildContext context) {
    int orderId = ModalRoute.of(context).settings.arguments;
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
                  senddata(orderId);
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
