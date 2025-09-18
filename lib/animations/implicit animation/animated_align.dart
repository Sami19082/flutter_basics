import 'dart:math';

import 'package:flutter/material.dart';

class Animatedalign extends StatefulWidget {
  const Animatedalign({super.key});

  @override
  State<Animatedalign> createState() => _AnimatedalignState();
}

class _AnimatedalignState extends State<Animatedalign> {
  var arrAlign = [
    Alignment.bottomCenter,
    Alignment.topCenter,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topLeft,
    Alignment.topRight,
  ];
  Alignment mAlignment = Alignment.bottomCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animatedalign'),
        ),
        body: Center(
          child: AnimatedAlign(
            alignment: mAlignment,
            duration: Duration(seconds: 2),
            child: InkWell(
              onTap: () {
                setState(() {
                  mAlignment = arrAlign[Random().nextInt(arrAlign.length - 1)];
                });
              },
              child: Text(
                "Hello World",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ));
  }
}
