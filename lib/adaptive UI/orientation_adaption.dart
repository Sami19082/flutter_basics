import 'package:flutter/material.dart';

void main() {
  runApp(OrientationAdaption());
}

class OrientationAdaption extends StatelessWidget {
  const OrientationAdaption({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var mWidth = mq.size.width;
    var mHeight = mq.size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orientation and Adaption"),
        centerTitle: true,
      ),
      body: mq.orientation == Orientation.landscape
          ? Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.red,
                      child: Center(child: Text("Hello Flutterias!!",style: TextStyle(fontSize: mWidth>400?25:20,fontWeight: FontWeight.bold,color: Colors.white,))),
                )),
                Expanded(child: OrientationBuilder(builder: (ctx, orientation) {
                  return orientation == Orientation.landscape ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5),
                      itemBuilder: (ctx, index) {
                        return Container(
                          color: Colors.green,
                        );
                      }) : ListView.builder(
                      itemCount: 11,
                      itemBuilder: (ctx, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: double.infinity,
                            color: Colors.blue,
                          ),
                        );
                      }) ;
                })),
              ],
            )
          : Column(
              children: [
                Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Center(child: Text("Hello Flutterias!!",style: TextStyle(fontSize: mWidth>400?20:18,fontWeight: FontWeight.bold,color: Colors.white,))),
                    )),
                Expanded(
                    child: ListView.builder(
                        itemCount: 11,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              color: Colors.blue,
                            ),
                          );
                        })),
              ],
      ),
    );
  }
}
