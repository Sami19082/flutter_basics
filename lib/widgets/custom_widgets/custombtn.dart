import 'package:flutter/material.dart';

class elevatedbtn extends StatelessWidget {
  String text;
  VoidCallback ontap;
  double width;
  double height;
  Color bgcolor;
  Color fgcolor;
  IconData? icon;

  elevatedbtn(
      {required this.text,
      required this.ontap,
      this.bgcolor = Colors.blue,
      this.fgcolor = Colors.black,
      this.width = 150,
      this.height = 60,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.blueAccent,
          ),
          onPressed: ontap,
          child: icon != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon),
                    SizedBox(width: 10),
                    Text(text),
                  ],
                )
              : Text(text)),
    );
  }
}
