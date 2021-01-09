import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class AddProduct extends StatelessWidget {
  
  TextEditingController category = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  Future<List> senddata() async {
    print("req");

    await http.post("http://192.168.29.232/php_flutter/input_employees.php",
        body: <String, String>{
          "eid": id.text,
          "name": name.text,
          "age": name.text,
          "addr": price.text,
          "phno": category.text,
        });
  }
  @override
  Widget build(BuildContext context) {
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
                "Item ID",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: id,
                decoration: InputDecoration(hintText: 'ID'),
              ),
              Text(
                "Item Name",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              Text(
                "Item Price",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: price,
                decoration: InputDecoration(hintText: 'price'),
                keyboardType: TextInputType.number,
              ),
              Text(
                "Item Category",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                controller: category,
                decoration: InputDecoration(hintText: 'Address'),
              ),
              
              RaisedButton(
                child: Text("ADD EMPLOYEE"),
                onPressed: () {
                  //senddata();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
