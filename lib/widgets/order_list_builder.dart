import 'package:flutter/material.dart';

class OrderedListBuilder extends StatelessWidget {
  final String imgurl;
  final String id;
  final String title;
  OrderedListBuilder(this.id, this.title, this.imgurl);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 100,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Container(
                  width: 100,
                  child: Image.network(
                    imgurl,
                    height: double.infinity,
                  ),
                ),
                SizedBox(width: 40),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 120,
                        child: Flexible(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "ITEM: ${title.toUpperCase()}",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'PRICE GOES HERE',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: null,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
