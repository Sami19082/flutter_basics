import 'package:classico/navigators/push_named/approutes.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(routednavi());
}

class routednavi extends StatelessWidget {
  const routednavi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:AppRoutes.splashPage,
      routes: AppRoutes.myRoutes()
    );
  }
}
