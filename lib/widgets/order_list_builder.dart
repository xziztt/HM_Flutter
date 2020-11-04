import 'package:flutter/material.dart';

class OrderedListBuilder extends StatelessWidget {
  final String imgurl;
  final String id;
  final String title;
  OrderedListBuilder(this.id, this.title, this.imgurl);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          color: Colors.black,
          height: 100,
          child: Row(
            children: <Widget>[Image.network(imgurl)],
          )),
    );
  }
}
