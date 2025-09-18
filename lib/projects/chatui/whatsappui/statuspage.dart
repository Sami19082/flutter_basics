import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Mystatuspage(),
    );
  }
}

class Mystatuspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("Status"), actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ]),
        body: ListView.builder(scrollDirection : Axis.horizontal,itemCount: 10,itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("data")
          );
    }));
  }
}
