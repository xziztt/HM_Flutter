import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mealsApp/managerStuff/managerOptions.dart';

class DeleteEmployees extends StatelessWidget {
  Future<List> senddata(String id) async {
    print(id);
    print("req");

    await http.post("http://192.168.29.232/php_flutter/delete_with_id.php",
        body: <String, String>{
          "eid": id,
        });
  }

  static final routeName = "/delete-employees";
  @override
  Widget build(BuildContext context) {
    TextEditingController idcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Delete Employees"),
      ),
      body: Column(
        children: [
          TextField(
            cursorColor: Colors.white,
            controller: idcontroller,
            decoration: InputDecoration(
                labelText: "Input ID", labelStyle: TextStyle(fontSize: 30)),
          ),
          FlatButton(
              child: Text(
                "CONFIRM DELETE",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () => {
                    senddata(idcontroller.text),
                    Navigator.of(context).pushNamed(ManagerOptions.routeName)
                  })
        ],
      ),
    );
  }
}
