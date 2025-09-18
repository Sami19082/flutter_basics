// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// class animatedBuilder extends StatefulWidget {
//   const animatedBuilder({super.key});
//
//   @override
//   State<animatedBuilder> createState() => _animatedBuilderState();
// }
//
// class _animatedBuilderState extends State<animatedBuilder>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     animationController =
//         AnimationController(vsync: this, duration: Duration(seconds: 2))
//           ..repeat(period: Duration(seconds: 1));
//   }
//   @override
//   void dispose(){
//     animationController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Animated Builder"),
//         ),
//         body: Center(
//           //animate only the child not the full UI without set sate //
//           child: AnimatedBuilder(
//               animation: animationController,
//               builder: (context, childToAnimate) {
//                 //also tween animation can be implemented
//                 return Transform.rotate(
//                   angle: animationController.value * pi,
//                   child: childToAnimate,
//                 );
//                 /*return Transform.translate(
//                   offset: Offset(0,animationController.value*-500),
//                   child: childToAnimate);*/
//                 /*return Transform.scale(
//                 scale: animationController.value * 2,
//                 child: childToAnimate,
//               );*/
//               },
//               child: Image.asset("lib/assets/images.jpg")),
//         ));
//   }
// }

import 'dart:math';
import 'package:flutter/material.dart';

class animatedcar extends StatefulWidget {
  @override
  State<animatedcar> createState() => _animatedcarState();
}

class _animatedcarState extends State<animatedcar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat(period: Duration(seconds: 3));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animated Car"),
        ),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assets/road.jpg"),
                      fit: BoxFit.cover)),
            ),
            AnimatedBuilder(
                animation: animationController,
                builder: (context, childToAnimate) {
                  return Transform.translate(
                      offset: Offset(animationController.value * 2000, 0),
                      child: childToAnimate);
                },
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 1,
                      child: SizedBox(
                          height: 500,
                          width: 500,
                          child: Image.asset("lib/assets/car.png")),
                    ),
                    Positioned(
                        bottom: 170,
                        left: 45,
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: animationController.value * pi * 10,
                                child: child,
                              );
                            },
                            child: Image.asset("lib/assets/wheelss.png"),
                          ),
                        )),
                    Positioned(
                        bottom: 170,
                        left: 350,
                        child: SizedBox(
                          height: 90,
                          width: 90,
                          child: AnimatedBuilder(
                            animation: animationController,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: animationController.value * pi * 10,
                                child: child,
                              );
                            },
                            child: Image.asset("lib/assets/wheelss.png"),
                          ),
                        ))
                  ],
                ))
          ],
        ));
  }
}
