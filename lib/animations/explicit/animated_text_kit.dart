import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class animatedText extends StatelessWidget {
  const animatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animated Text Kit From Package'),
        ),
        body: Center(
            child: AnimatedTextKit(animatedTexts: [
          FadeAnimatedText("Hello",
              textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          FadeAnimatedText("World",
              textStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold)),
          TyperAnimatedText("Welcome to Flutter",
              textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold))
        ])));
  }
}
