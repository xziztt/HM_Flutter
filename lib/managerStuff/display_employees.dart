import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(DisplayEmployees());

class DisplayEmployees extends StatelessWidget {
  static final routeName = '/display-employees';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: DisplayEmployeeHome(),
    );
  }
}

class DisplayEmployeeHome extends StatefulWidget {
  @override
  _DisplayEmployeeHomeState createState() => _DisplayEmployeeHomeState();
}

class _DisplayEmployeeHomeState extends State<DisplayEmployeeHome> {
  List data = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response =
        await http.get('http://192.168.29.232/php_flutter/fetch.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print(data[0]['name']);
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
                        data[index]['eid'],
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
                        data[index]['age'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['addr'],
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
                        data[index]['salary'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        data[index]['salary'],
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
