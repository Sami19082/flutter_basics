import 'dart:ui';

import 'package:flutter/material.dart';

class Backdropfilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Backdropfilter"),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Image.asset("lib/assets/wedding_drone.jpg",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 5),
              child: Center(
                child: Text(
                  "BackDrop Filter",
                  style: TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
