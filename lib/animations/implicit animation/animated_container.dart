import 'dart:math';

import 'package:flutter/material.dart';

class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer> {
  double width = 200;
  double height = 200;
  Color color = Colors.green;
  double mBorder = 5 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Container'),
        ),
        body: Center(
          child: InkWell(
            onTap: () {

              /// for repeat
              // width = width == 200 ? 400 : 200;
              // height = height == 200 ? 400 : 200;

              width = Random().nextInt(300).toDouble();
              height = Random().nextInt(300).toDouble();

              // color = color == Colors.orange ? Colors.green : Colors.orange;
              mBorder = Random().nextInt(50).toDouble();
              color = Colors.primaries[Random().nextInt(Colors.primaries.length-1)];
              setState(() {});
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(mBorder),
              ),
            ),
          ),
        ));
  }
}
