import 'package:classico/widgets/Tabs/setting-tab.dart';
import 'package:classico/widgets/Tabs/status_tab.dart';
import 'package:flutter/material.dart';
import 'call_tab.dart';
import 'chattab.dart';

void main() {
  runApp(Tabbar());
}

class Tabbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabbarHome(),
    );
  }
}

class TabbarHome extends StatefulWidget {
  @override
  State<TabbarHome> createState() => _TabbarHomeState();
}

/// using mixing class with singletickerproviderstatemixin ///
class _TabbarHomeState extends State<TabbarHome>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  String mTitle = "TabBar";

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (tabController.index == 0) {
        mTitle = "Chats";
      } else if (tabController.index == 1) {
        mTitle = "Calls";
      } else if (tabController.index == 2) {
        mTitle = "Settings";
      }else if (tabController.index == 3) {
        mTitle = "Status";
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    /// also can use DefaultTabController On wrap scaffold ///
    return Scaffold(
      appBar: AppBar(
        title: Text(mTitle),
        centerTitle: true,
        bottom: TabBar(
            controller: tabController,
            isScrollable: false,
            /*indicatorColor: Colors.white,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),*/
            tabs: const [
              Tab(
                icon: Icon(Icons.chat),
                text: "Chats",
              ),
              Tab(
                icon: Icon(Icons.call),
                text: "Calls",
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: "Settings",
              ),
              Tab(
                icon: Icon(Icons.circle_outlined),
                text: "Status",
              ),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        Chattabpage(),
        calltabpage(),
        settingstabpage(),
        statustabpage()
      ]),
    );
  }
}
