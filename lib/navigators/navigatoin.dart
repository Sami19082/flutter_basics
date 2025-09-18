import 'package:classico/navigators/splashscreen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(Navigation());
}
class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen(),
    );
  }
}

