/*
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref extends StatefulWidget {
  @override
  State<SharePref> createState() => _SharePrefState();
}

class _SharePrefState extends State<SharePref> {
  TextEditingController _controller = TextEditingController();
  String? nameFromPrefs;

  @override
  void initState() {
    super.initState();
    getName();
  }

  void getName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameFromPrefs = prefs.getString("name");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefferences"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(nameFromPrefs != null ? "Welcome $nameFromPrefs" : ""),
          TextField(
            controller: _controller,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                var name = _controller.text.toString();
                var prefs = await SharedPreferences.getInstance();
                prefs.setString("name", name);
              },
              child: Text("Saved"))
        ],
      ),
    );
  }
}


*/

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SharedPrefsState();
  }
}

class _SharedPrefsState extends State<SharedPrefs> {
  int time = 0;
  @override
  void initState() {
    super.initState();
    getTime();
  }
void getTime() async{
    var prefs = await SharedPreferences.getInstance();
   var count =  prefs.getInt("key");
   // condition given to prefs
  if(count!=null){
    count++;
  }else{
    count = 0;
    count++;
  }
  time =count;
  prefs.setInt("key", count);
  setState(() {
    
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref"),
        centerTitle: true,
      ),
      body: Container(
        color: time % 3 == 0 ? Colors.red : Colors.green,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Have Opened The App For $time Time",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
