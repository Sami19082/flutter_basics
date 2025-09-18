import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    for (String? element in listData) {
      listWidget.add(Container(
        width: double.infinity,
        height: 100,
        color: Colors.blue,
        margin: EdgeInsets.all(11),
        child: Center(
          child: Text(
            element ?? "null",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ));
    }

    return Scaffold(
      body: ListView(
          children: listData
              .map((e) => InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.blue,
                    margin: EdgeInsets.all(11),
                    child: Center(
                      child: Text(
                        "$e",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    print(e);
                  }))
              .toList()),
    );
  }
}

/// both are right methods
