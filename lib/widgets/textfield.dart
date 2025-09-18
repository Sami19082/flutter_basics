import 'package:flutter/material.dart';

void main() {
  runApp(Textfield());
}

class Textfield extends StatelessWidget {
  const Textfield({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: TextPage(),
    );
  }
}

class TextPage extends StatelessWidget {
  var nameController = TextEditingController();
  var passController = TextEditingController();
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              // maxLines: 2,
              // enabled: false,
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              /* onChanged: (v){
                print(v);
                ///on change use for searching from text or getting the value ///
              },*/
              decoration: InputDecoration(
                label: Text("Name"),
                labelStyle: TextStyle(color: Colors.blue),
                hintText: "Enter your Name",
                prefixIcon: Icon(Icons.account_circle),
                prefixIconColor: Colors.blue,
                prefixText: "Mr.",
                suffixText: "@gmail.com",
                /* border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                    width: 2
                  )
                )*/
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue, width: 2)),
                /*disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Colors.green,
                        width: 2
                    )
                )*/
                /*errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2
                    )
                )*/
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passController,
              maxLength: 6,
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                counterText: "",
                  label: Text("Password"),
                  labelStyle:
                      TextStyle(color: isEnable ? Colors.blue : Colors.red),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.blue,
                  suffixIcon: Icon(Icons.visibility_off),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.blue, width: 2)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2))),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  print(nameController.text.toString());
                },
                child: Icon(Icons.login))
          ],
        ),
      ),
    );
  }
}
