import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage1(),
    );
  }
}

class MyHomePage1 extends StatelessWidget {
  List<String?> listData = [
    'Machine Learning',
    null,
    "Deep Learning",
    "Computer Vision",
    "Natural Language Processing",
    "Reinforcement Learning",
    "Unsupervised Learning",
    "Supervised Learning",
    "Data Mining",
    "Data Science",
    "Data Analysis",
    'Machine Learning',
    "Deep Learning",
    "Computer Vision",
    "Natural Language Processing",
    "Reinforcement Learning",
    "Unsupervised Learning",
    "Supervised Learning",
    "Data Mining",
    "Data Science",
    "Data Analysis",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(12),
              height: 100,
              color: Colors.blueAccent,
              child: Center(
                  child: Text(
                listData[index].toString(),
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              )),
            );
          }),
    );
  }
}
