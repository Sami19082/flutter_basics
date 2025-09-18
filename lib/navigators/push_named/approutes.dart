import 'package:flutter/material.dart';
import '../splashscreen.dart';
import 'home.dart';

class AppRoutes{
  static const String splashPage = "/splash";
  static const String homePage = "/home";
  static const String secondPage = "/second";
  /// all page in your app ///

static Map<String, Widget Function(BuildContext)> myRoutes(){
  return {
    splashPage : (context) => SplashScreen(),
    homePage : (context) => routehome(),
  };
}
}