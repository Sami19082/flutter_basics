import 'package:flutter/material.dart';
import 'Tabs/call_tab.dart';
import 'Tabs/setting-tab.dart';
import 'Tabs/status_tab.dart';

class DrawerHome extends StatefulWidget {
  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  List<Map<String, dynamic>> drawerList = [
    {"Icon": Icons.home, "Text": "Home"},
    {"Icon": Icons.call, "Text": "Calls"},
    {"Icon": Icons.settings, "Text": "Settings"},
    {"Icon": Icons.logout, "Text": "Logout"},
  ];

  int selectedIndex = 0;

  List<Widget> listNaviPage = [
    calltabpage(),
    statustabpage(),
    settingstabpage(),
    calltabpage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Drawer")),
        body: listNaviPage[selectedIndex],
        drawer: Drawer(
            width: 300,
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(),
                          SizedBox(width: 11,),
                          SizedBox(
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("SK SAMIDULLA"),
                                Text("SkSamidulla@gmail.com")
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: drawerList.length,
                      itemBuilder: (_, index) {
                        return ListTile(
                          onTap: () {
                            if (index==4){

                            }else{
                              setState(() {
                                selectedIndex = index;
                              });
                              Navigator.pop(context);
                            }
                          },
                          leading: Icon(drawerList[index]["Icon"]),
                          title: Text(drawerList[index]["Text"]),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Version 10.0202252",style: TextStyle(color: Colors.grey),),
                )
              ],
            )));
  }
}
