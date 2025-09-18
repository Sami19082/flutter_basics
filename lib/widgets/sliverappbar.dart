import 'package:flutter/material.dart';

void main() {
  runApp(Sliverappbar());
}

class Sliverappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SliverHome(),
    );
  }
}

class SliverHome extends StatefulWidget {
  @override
  State<SliverHome> createState() => _SliverHomeState();
}

class _SliverHomeState extends State<SliverHome> {
  List<Map<String, dynamic>> data = [
    {"Icon": Icons.home, "Text": "Home"},
    {"Icon": Icons.call, "Text": "Calls"},
    {"Icon": Icons.settings, "Text": "Settings"},
    {"Icon": Icons.logout, "Text": "Logout"},
  ];

  late String initialValue;

  @override
  initState() {
    super.initState();
    initialValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueAccent,
        title: Text("AppBar"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            side: BorderSide(
                color: Colors.black,
                width: 0.9,
                strokeAlign: BorderSide.strokeAlignCenter)),
        shadowColor: Colors.grey,
        elevation: 10,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          PopupMenuButton(
              initialValue: initialValue,
              onSelected: (value) {
                initialValue = value.toString();
                setState(() {});
              },
              color: Colors.yellow,
              shadowColor: Colors.black,
              elevation: 10,
              tooltip: "Menu",
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (context) {
                return data
                    .map((eachData) => PopupMenuItem(
                        value: eachData["Text"],
                        onTap: () {
                          if (eachData["Text"] == "Settings") {
                            print("Settings");
                          } else if (eachData["Text"] == "Logout") {
                            print("Logout");
                          } else if (eachData["Text"] == "Home") {
                            print("Home");
                          } else if (eachData["Text"] == "Calls") {
                            print("Calls");
                          }
                        },
                        child: Row(
                          children: [
                            Icon(eachData["Icon"]),
                            Text(eachData["Text"])
                          ],
                        )))
                    .toList();
              })
        ],
        pinned: true,
        snap: false,
        floating: true,
        expandedHeight: 100,
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            title: Text("Item ${index + 1}"),
          );
        }),
      )
    ]));
  }
}
