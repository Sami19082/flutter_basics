import 'package:classico/navigators/secondpage.dart';
import 'package:flutter/material.dart';

class NaviHomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation UI"),
      ),
      body: Container(
        color: Colors.green.shade200,
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 100,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondpage(
                                    txt: controller.text.toString(),
                                    index: index+1,
                                  )));
                    },
                    child: Text("${index + 1}")),
              ],
            ),
          );
        }),

        // child: Column(
        //   children: [
        //     TextField(controller: controller),
        //     Center(
        //       child: ElevatedButton(
        //           onPressed: () {
        //             var name = controller.text.toString();
        //             Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                     builder: (context) => Secondpage(txt: name)));
        //           },
        //           child: Icon(Icons.next_plan)),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
