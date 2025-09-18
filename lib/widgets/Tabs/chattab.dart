import 'package:flutter/material.dart';

class Chattabpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
        child: Center(
      child: Text(
        "Chat Page",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.teal),
      ),
    ));
  }
}
