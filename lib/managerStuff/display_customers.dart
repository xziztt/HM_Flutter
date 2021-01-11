import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(DisplayCustomers());

class DisplayCustomers extends StatelessWidget {
  static final routeName = '/display-customers';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: DisplayCustomersHome(),
    );
  }
}

class DisplayCustomersHome extends StatefulWidget {
  @override
  _DisplayCustomersHomeState createState() => _DisplayCustomersHomeState();
}

class _DisplayCustomersHomeState extends State<DisplayCustomersHome> {
  List data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response =
        await http.get('http://192.168.29.232/php_flutter/get_customers.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print("cid");
        print(data[0]['eid']);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("details"),
      ),
      body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) => Container(
                child: Container(
                  width: 200,
                  child: Row(
                    children: [
                      Text(
                        data[index]['cid'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['email'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['phno'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['total'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['eid'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
