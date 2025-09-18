import 'package:flutter/material.dart';

class Customtxt extends StatelessWidget {
  String text;
  Color color;
  double size;
  FontWeight weight;
  FontStyle style;
  Color bgColor;

  Customtxt({
    required this.text,
    required this.size,
    this.color = Colors.black,
    this.weight = FontWeight.bold,
    this.style = FontStyle.normal,
    this.bgColor = Colors.yellow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        backgroundColor: bgColor,
        color: color,
        fontSize: size,
        fontStyle: style,
        fontWeight: weight,
      ),
    );
  }
}
