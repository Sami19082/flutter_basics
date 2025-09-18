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
  int result = 0;

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
            ElevatedButton(
                onPressed: () {
                  /// This is Local State Management ///
                  setState(() {
                    int a = int.parse(_no1.text.toString()),
                        b = int.parse(_no2.text.toString()),
                        c = a + b;
                    result = c;
                  });
                },
                child: Text("Result")),
            SizedBox.square(dimension: 10),
            Text(
              "$result",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
