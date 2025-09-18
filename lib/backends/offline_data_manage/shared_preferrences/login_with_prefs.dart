import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class LoginWithPrefs extends StatefulWidget {
  const LoginWithPrefs({super.key});

  @override
  State<LoginWithPrefs> createState() => _LoginWithPrefsState();
}

class _LoginWithPrefsState extends State<LoginWithPrefs> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent.shade200,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Enter Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                    )),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () async {
                    //if user is Logged In
                    var prefs = await SharedPreferences.getInstance();
                    var name = emailController.text.toString();
                    prefs.setString("name", name);
                    prefs.setBool("key", true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) {
                      return Home();
                    }));
                  },
                  child: (Text("Login"))),
            ],
          ),
        ),
      ),
    );
  }
}
