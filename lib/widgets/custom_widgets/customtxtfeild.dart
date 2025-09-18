import 'package:flutter/material.dart';

class Customtxtfield extends StatelessWidget {
  TextEditingController controller;
  String hinttext;
  bool obscuretext;
  double enableradious;
  double focusradious;
  double width;
  Color enableBorderColor;
  Color focusBorderColor;
  BorderStyle enableBorderStyle;
  BorderStyle focusBorderStyle;

  Customtxtfield({
    required this.controller,
    this.hinttext = "enter text",
    this.obscuretext = false,
    this.enableradious = 10,
    this.focusradious = 20,
    this.width = 2,
    this.enableBorderColor = Colors.grey,
    this.focusBorderColor = Colors.blue,
    this.enableBorderStyle = BorderStyle.solid,
    this.focusBorderStyle = BorderStyle.solid,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        obscureText: obscuretext,
        decoration: InputDecoration(
          hintText: hinttext,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: focusBorderStyle,
              width: width,
              color: focusBorderColor,
            ),
            borderRadius: BorderRadius.circular(focusradious),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              style: enableBorderStyle,
              width: width,
              color: enableBorderColor,
            ),
            borderRadius: BorderRadius.circular(enableradious),
          ),
        ));
  }
}
/// you can also customise only decoration part like input decoration or border decoration  rather then full customisation of the TextField ///