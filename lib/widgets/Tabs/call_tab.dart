import 'package:flutter/material.dart';

class calltabpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Center(
          child: Text(
            "call Page",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.teal),
          ),
        ));
  }
}