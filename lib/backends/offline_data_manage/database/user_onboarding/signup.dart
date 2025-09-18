import 'package:flutter/material.dart';

import '../Db.dart';
import '../model_classes/usermodel.dart';
import 'loginpage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("SignUp Here"),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: "User Name",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty) {
                var appDb = AppDataBase.instance;
                var check = await appDb.createAccount(UserModel(
                    user_id: 0,
                    user_name: nameController.text,
                    user_email: emailController.text,
                    user_password: passwordController.text));
                var msg = "";
                if (check) {
                  msg = "User Created Successfully";
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (ctx) {
                    return LoginPage();
                  }));
                } else {
                  msg = "User Already Existed";
                }
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(msg)));
              }
            },
            child: Text("SignUp")),
        SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (ctx) {
                return LoginPage();
              }));
            },
            child: Text("Already have an account? Login"))
      ]),
    );
  }
}
