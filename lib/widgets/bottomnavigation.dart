import 'package:classico/widgets/Tabs/setting-tab.dart';
import 'package:classico/widgets/Tabs/status_tab.dart';
import 'package:flutter/material.dart';

import 'Tabs/call_tab.dart';

void main() {
  runApp(Bottomnavigation());
}

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomnavigationHome(),
    );
  }
}

class BottomnavigationHome extends StatefulWidget {
  @override
  State<BottomnavigationHome> createState() => _BottomnavigationHomeState();
}

class _BottomnavigationHomeState extends State<BottomnavigationHome> {
  List<Widget> listNaviPage = [
    calltabpage(),
    statustabpage(),
    settingstabpage(),
    calltabpage()
  ];
  int mIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Bottom Navigation"),
        centerTitle: true,
      ),
      body: listNaviPage[mIndex],
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.orange,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: mIndex,
          onDestinationSelected: (index) {
            mIndex = index;
            setState(() {});
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.call), label: "Calls"),
            NavigationDestination(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
