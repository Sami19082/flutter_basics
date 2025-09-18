import 'package:flutter/material.dart';

class Animatedopacity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AnimatedopacityState();
  }
}

class AnimatedopacityState extends State<Animatedopacity>{
 double mOpacity = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Opacity"),
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            mOpacity = mOpacity == 1 ? 0.2 : 1;
            setState(() {

            });
          },
          child: AnimatedOpacity(
              opacity: mOpacity,
              duration: Duration(seconds: 2),
          child: Container(width: 200,height: 200,color: Colors.red,),),
        ),
      ),
    );
  }
}