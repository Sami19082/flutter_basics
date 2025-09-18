import 'package:flutter/material.dart';
import 'custombtn.dart';
import 'customcontainer.dart';
import 'customtxt.dart';
import 'customtxtfeild.dart';

void main() {
  runApp(customWidegts());
}

class customWidegts extends StatelessWidget {
  const customWidegts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: customHome(),
    );
  }
}

class customHome extends StatelessWidget {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            elevatedbtn(
                bgcolor: Colors.yellow,
                fgcolor: Colors.red,
                height: 80,
                width: 200,
                text: "Login",
                icon: Icons.login,
                ontap: () {
                  print('Logged In');
                }),
            SizedBox(
              height: 20,
            ),
            Customtxt(
              text: "Hello world",
              size: 20,
              color: Colors.green,
              bgColor: Colors.transparent,
              style: FontStyle.italic,
            ),
            SizedBox(
              height: 20,
            ),
            Customtxtfield(
              controller: name,
              hinttext: "Enter you name",
              focusradious: 20,
            ),
            SizedBox(
              height: 20,
            ),
            CustomContainer(height: 200, width: 200, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
