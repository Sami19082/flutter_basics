import 'package:flutter/material.dart';

void main() {
  runApp(Noteapp());
}

class Noteapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatelessWidget {
  List<Color> colorlist = [
    Colors.red.shade100,
    Colors.brown.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.green.shade100,
    Colors.amber.shade100,
    Colors.deepPurpleAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.cyan.shade100,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.green.shade100,
    Colors.amber.shade100,
    Colors.deepPurpleAccent.shade100,
    Colors.tealAccent.shade100,
    Colors.cyan.shade100,
  ];
  List<Map<String, dynamic>> listData = [
    {
      "name": "Mitika",
      "msg": "Noob ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Laado",
      "msg": "Bubu i misss youuu",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "haley",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Ritik",
      "msg": "Typing..",
      "avatar": Icon(Icons.boy),
      "count": "9",
      "time": "03:00 pm",
      "color": Colors.green
    },
    {
      "name": "samid",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "0",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Sagar",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Kausar",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Raja",
      "msg": "Typing..",
      "avatar": Icon(Icons.person),
      "count": "0",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Pawan",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Ramesh",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Rameet",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Verma",
      "msg": "Hello !",
      "avatar": Icon(Icons.boy),
      "count": "9",
      "time": "03:00 pm",
      "color": Colors.green
    },
    {
      "name": "haley",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Ritik",
      "msg": "Hello !",
      "avatar": Icon(Icons.boy),
      "count": "9",
      "time": "03:00 pm",
      "color": Colors.green
    },
    {
      "name": "samid",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "0",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Sagar",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Kausar",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Raja",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "0",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Pawan",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Ramesh",
      "msg": "Typing..",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Rameet",
      "msg": "Hello ! Where are you?",
      "avatar": Icon(Icons.person),
      "count": "2",
      "time": "10:00 pm",
      "color": Colors.green
    },
    {
      "name": "Verma",
      "msg": "Typing..",
      "avatar": Icon(Icons.boy),
      "count": "9",
      "time": "03:00 pm",
      "color": Colors.green
    },
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpapers"),
      ),
      backgroundColor: Colors.black,
      body: GridView.builder(
          itemCount: colorlist.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 1, mainAxisSpacing: 1, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: colorlist[index],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text(listData[index]["msg"])),
              ),
            );
          }),
    );
  }
}
