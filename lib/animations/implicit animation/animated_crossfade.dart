import 'package:flutter/material.dart';

class Animatedcrossfade extends StatefulWidget {
  const Animatedcrossfade({super.key});

  @override
  State<Animatedcrossfade> createState() => _AnimatedcrossfadeState();
}

class _AnimatedcrossfadeState extends State<Animatedcrossfade> {

  bool isFirstview = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedCrossFade'),
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            setState(() {
              isFirstview = !isFirstview;
            });
          },
          child: AnimatedCrossFade(
            duration: Duration(seconds: 2),
            firstChild: Container(
              width: 350,
              height: 350,
              color: Colors.blueAccent,
              child: Center(
                child: Text("Tab To Reveal"),
              ),
            ),
            secondChild: SizedBox(
              width: 350,
              height: 350,
              child: Image.asset("lib/assets/wedding_drone.jpg",fit: BoxFit.cover,),
            ), crossFadeState: isFirstview ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      )
    );
  }
}
