import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_with_prefs.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "";

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void getUserName() async {
    var prefs = await SharedPreferences.getInstance();
    var username = prefs.getString("name");
    name = username!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            name == "" ? "" : "Hello, $name",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool("key", false);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) {
                  return LoginWithPrefs();
                }));
              },
              child: Text("Logout"))
        ],
      ),
    );
  }
}
