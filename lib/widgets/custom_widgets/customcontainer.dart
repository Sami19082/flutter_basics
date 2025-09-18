import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget{
  double height;
  double width;
  Color color;
  CustomContainer({
    required this.height,
    required this.width,
    required this.color,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.amber,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}