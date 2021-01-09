import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String username = '';

class AddNewItem extends StatefulWidget {
  static final routeName = '/add-items';
  @override
  _AddNewItemState createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  TextEditingController id = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController price = new TextEditingController();

  Future<List> senddata() async {
    print("req");
    print(name.text);

    await http.post("http://192.168.29.232/php_flutter/input_items.php",
        body: <String, String>{
          "itemid": id.text,
          "itemname": name.text,
          "itemprice": price.text,
          "category": dropDownValue,
        });
  }

  @override
  String dropDownValue = 'Italian';
  Widget build(BuildContext context) {
    int orderId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Add new item'),
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
                controller: id,
                decoration: InputDecoration(hintText: 'id'),
              ),
              Text(
                "Email",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              Text(
                "Mobile",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(hintText: 'Price'),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton(
                dropdownColor: Colors.white,
                value: dropDownValue,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (newValue) {
                  setState(() {
                    dropDownValue = newValue;
                    print(dropDownValue);
                  });
                },
                items: <String>[
                  'Italian',
                  'Quick & Easy',
                  'Hamburgers',
                  'German',
                  'Light & Lovely',
                  'Exotic',
                  'Breakfast',
                  'Asian',
                  'French',
                  'Summer'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                child: Text("Add Item"),
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
