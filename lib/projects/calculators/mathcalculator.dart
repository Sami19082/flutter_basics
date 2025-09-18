import 'package:flutter/material.dart';

void main() {
  return runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return homeState();
  }
}

class homeState extends State<home> {
  var _no1 = TextEditingController();
  var _no2 = TextEditingController();
  var result = 0;
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _no1,
              decoration: InputDecoration(
                hintText: "Enter Number",
                labelText: "Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox.square(dimension: 10),
            TextField(
              controller: _no2,
              decoration: InputDecoration(
                hintText: "Enter Number",
                labelText: "Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox.square(dimension: 10),
            Row(
              children: [
                TextButton(onPressed: (){
                  if(_no1.text.isNotEmpty && _no2.text.isNotEmpty){
                    setState(() {
                      result = int.parse(_no1.text) + int.parse(_no2.text);
                    });
                  }
                  else {
                    setState(() {
                      result = 0;
                      error = "Enter Number in both fields";
                    });
                  }
                }, child: Text("Add")),
                TextButton(onPressed: (){
                  if(_no1.text.isNotEmpty && _no2.text.isNotEmpty){
                    setState(() {
                      result = int.parse(_no1.text) - int.parse(_no2.text);
                    });
                  }
                  else {
                    setState(() {
                      result = 0;
                      error = "Enter Number in both fields";
                    });
                  }
                }, child: Text("SUB")),
                TextButton(onPressed: (){
                  if(_no1.text.isNotEmpty && _no2.text.isNotEmpty){
                    setState(() {
                      result = int.parse(_no1.text) ~/ int.parse(_no2.text);
                    });
                  }
                  else {
                    setState(() {
                      result = 0;
                      error = "Enter Number in both fields";
                    });
                  }
                }, child: Text("DIV")),
                TextButton(onPressed: (){
                  if(_no1.text.isNotEmpty && _no2.text.isNotEmpty){
                    setState(() {
                      result = int.parse(_no1.text) * int.parse(_no2.text);
                    });
                  }
                  else {
                    setState(() {
                      result = 0;
                      error = "Enter Number in both fields";
                    });
                  }
                }, child: Text("MULTI")),
                TextButton(onPressed: (){
                  if(_no1.text.isNotEmpty && _no2.text.isNotEmpty){
                    setState(() {
                      result = int.parse(_no1.text) % int.parse(_no2.text);
                    });
                  }
                  else {
                    setState(() {
                      result = 0;
                      error = "Enter Number in both fields";
                    });
                  }
                }, child: Text("%")),
              ],
            ),
            SizedBox.square(dimension: 10),
            Text(
              "$result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox.square(dimension: 10),
            Text(
              _no1.text.isNotEmpty || _no2.text.isNotEmpty ? "" : "$error",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
