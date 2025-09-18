import 'dart:math';

import 'package:flutter/material.dart';

class Animatedcontroller extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedcontrollerState();
  }
}

// for 1 Single ticker for more then 2 controller Simple
class AnimatedcontrollerState extends State<Animatedcontroller>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  // in tween can animate anything like color , size between start and ending
  late Animation<double> animatedDouble;
  late Animation<Color?> animatedColor;

  @override
  void initState() {
    super.initState();
    //0-1
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addListener(() {
            print(animatedColor.value);
            setState(() {});
          })
          ..repeat(reverse: true);
    animatedDouble =
        Tween<double>(begin: 0, end: 2*pi).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));
    animatedColor = ColorTween(begin: Colors.red, end: Colors.green).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Controller"),
      ),
      body: Center(
        child: Container(
          width: animatedDouble.value,
          height: animatedDouble.value,
          color: animatedColor.value,
        ),
      ),
    );
  }
}
