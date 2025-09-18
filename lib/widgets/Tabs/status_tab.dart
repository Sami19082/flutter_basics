import 'package:flutter/material.dart';

class statustabpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        child: Center(
          child: Text(
            "status Page",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.teal),
          ),
        ));
  }
}