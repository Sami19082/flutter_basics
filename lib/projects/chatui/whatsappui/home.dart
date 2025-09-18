import 'package:classico/projects/chatui/whatsappui/statuspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mystatuspage(),
    );
  }
}

class Myhomepage2 extends StatelessWidget {
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
    return Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        body: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: InkWell(
                  focusColor: Colors.grey.shade100,
                  onTap: () {},
                  child: ListTile(
                    title: Text(listData[index]["name"],style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: listData[index]["msg"] == "Typing.."
                        ? Text(
                      listData[index]["msg"],
                      style: TextStyle(color: Colors.green),
                    )
                        : Text(listData[index]["msg"]),
                    leading: CircleAvatar(
                      child: listData[index]["avatar"],
                    ),
                    trailing: Column(
                      children: [
                        listData[index]["count"] == "0"
                            ? Text(
                          listData[index]["time"],
                          style: TextStyle(color: Colors.black),
                        )
                            : Text(
                          listData[index]["time"],
                          style: TextStyle(color: Colors.green),
                        ),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: listData[index]["count"] == "0"
                                ? Colors.transparent
                                : listData[index]["color"],
                          ),
                          child: Center(
                              child: listData[index]["count"] == "0"
                                  ? Text("")
                                  : Text(
                                listData[index]["count"],
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );}));
  }
}
