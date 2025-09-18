import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class lottie extends StatefulWidget {
  const lottie({super.key});

  @override
  State<lottie> createState() => _lottieState();
}

//multiple control TickerProviderStateMixin for multiple animation
class _lottieState extends State<lottie> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Lottie"),
        ),
        body: Column(
          children: [
            Center(
              child: Lottie.asset("lib/assets/rive&lottie/Material wave loading.json",
                  controller: controller,
                  reverse: true, onLoaded: (composition) {
                controller.duration = composition.duration;
              }),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    controller.repeat(reverse: true);
                  },
                  child: Text("Play")),
            ),
            SizedBox.square(dimension: 10),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    controller.stop(canceled: true);
                  },
                  child: Text("Stop")),
            ),
          ],
        ));
  }
}
