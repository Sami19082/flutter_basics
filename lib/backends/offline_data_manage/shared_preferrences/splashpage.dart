import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'login_with_prefs.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashPageState();
  }
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      Widget navigateTo = LoginWithPrefs();
      var prefs = await SharedPreferences.getInstance();
      bool? isLoggedIn = prefs.getBool("key");

      if (isLoggedIn != null && isLoggedIn) {
        navigateTo = Home();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
        return navigateTo;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text("Splash Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Lottie.asset(
                  "lib/assets/rive&lottie/Material wave loading.json")),
          SizedBox(
            height: 20,
          ),
          Text(
            "Loading...",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
