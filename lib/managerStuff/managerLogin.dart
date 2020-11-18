import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mealsApp/managerStuff/display_employees.dart';
import 'package:mealsApp/managerStuff/managerOptions.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  static final routeName = '/manager-login';
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  List data = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void fetchData() async {
    final response =
        await http.get('http://192.168.29.232/php_flutter/fetch_managers.php');

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Manager Login'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'MANAGER LOGIN',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    cursorColor: Colors.white,
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.white30,
                      child: Text('Login'),
                      onPressed: () {
                        fetchData();
                        for (int i = 0; i < (data.length); i++) {
                          if (data[i]['name'] == nameController.text &&
                              data[i]["password"] == passwordController.text) {
                            Navigator.of(context)
                                .pushNamed(ManagerOptions.routeName);
                          }
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
