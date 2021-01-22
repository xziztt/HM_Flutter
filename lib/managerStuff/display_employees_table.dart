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
        print(data[0]['NAME']);
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          data[index]['EID'],
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.fade,
                        ),
                      ),
                     
                      SizedBox(
                         width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          data[index]['NAME'],
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      
                      SizedBox(
                         width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          data[index]['AGE'],
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    
                      SizedBox(
                         width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          data[index]['ADDRESS'],
                          overflow: TextOverflow.fade,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                     
                      SizedBox(
                         width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          data[index]['PHNO'],
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      
                      SizedBox(
                         width: MediaQuery.of(context).size.width/6,
                        child: Text(
                          
                          data[index]['SALARY'].toString(),
                          overflow: TextOverflow.clip,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                     
                    ],
                  ),
                ),
              )),
    );
  }
}
