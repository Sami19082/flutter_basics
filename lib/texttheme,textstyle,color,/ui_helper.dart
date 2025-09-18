import 'dart:ui';

import 'package:flutter/material.dart';

class UIHelper{
  // light colors
static final Color mPrimaryColor = Colors.blue.shade200;
static final Color mSecondaryColor = Colors.blueGrey.shade200;

// dark colors
static final Color mDarkPrimaryColor = Colors.blue;
static final Color mDarkSecondaryColor = Colors.blueGrey;

}

TextStyle mTextStyle43({fontWeight = FontWeight.normal, color = Colors.blue}){
  return TextStyle(
    fontSize: 43,
    color:  color,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
  );
}

TextStyle italicTextStyle33({fontWeight = FontWeight.normal, color = Colors.blue}){
  return TextStyle(
    fontSize: 33,
    color:  color,
    fontWeight: FontWeight.bold,
    fontFamily: 'LightItalic',
  );
}

TextStyle italicTextStyle53({fontWeight = FontWeight.normal, color = Colors.blue}){
  return TextStyle(
    fontSize: 53,
    color:  color,
    fontWeight: FontWeight.bold,
    fontFamily: 'LightItalic',
  );
}

TextStyle italicTextStyle14({fontWeight = FontWeight.normal, color = Colors.blue}){
  return TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color:  color,
    fontFamily: 'Montserrat',
  );
}