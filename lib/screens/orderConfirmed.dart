import 'package:flutter/material.dart';

class OrderConfirmed extends StatelessWidget {
  static final routeName = "/order-confirmed";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Confirmed"),
      ),
      body: Container(
        child: Text("Order Confirmed"),
      ),
    );
  }
}
