import 'package:flutter/material.dart';

class Secondpage extends StatelessWidget {
  String txt;
  int index;
  Secondpage({required this.txt, required this.index});

  /// [] optional positional parameters && {} optional named parameters///
  ///
  @override
  Widget build(BuildContext context) {

    var name = "";
    Color mColor = Colors.pink;
    if(index==1){
      name = "Samidulla";
      mColor = Colors.blue;
    }else if(index==2){
      name = "Ritik";
      mColor = Colors.red;
    }else if(index==3){
      name = "Kausar";
      mColor = Colors.green;
    }else if(index==4){
      name = "Sagar";
      mColor = Colors.yellow;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: mColor,
        child: Center(child: Text(name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
      )
    );
  }
}
