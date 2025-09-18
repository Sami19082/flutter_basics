import 'package:flutter/material.dart';

class settingstabpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            "settings Page",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.teal),
          ),
        ));
  }
}