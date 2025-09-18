import 'package:flutter/material.dart';

void main() {
  runApp(butoons());
}

class butoons extends StatelessWidget {
  const butoons({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: buttonpage(),
    );
  }
}

class buttonpage extends StatelessWidget {
  const buttonpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment. spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Elevated Button");
                },
                child: Text("Elevated Button"),style: ElevatedButton.styleFrom(
              elevation: 12,
              shadowColor: Colors.blue,
              backgroundColor: Colors.blue,
              // minimumSize: Size(100, 200),
              // maximumSize: Size(200, 300)
              fixedSize: Size(200, 80),
              foregroundColor: Colors.yellow
            ),),
            TextButton(onPressed: (){
              print("Text Button");
            }, child: Text("Text Button")),
            OutlinedButton(onPressed: (){
              print("Outlined Button");
            }, child: Text("Outlined Button"),style: ElevatedButton.styleFrom(),),
            IconButton(onPressed: (){
              print("Icon Button");
            }, icon: Icon(Icons.info)),
            FloatingActionButton(onPressed: (){
              print("Floating Button");
            }, child: Icon(Icons.add),),
          ],
        ),
      ),
    );
  }
}
