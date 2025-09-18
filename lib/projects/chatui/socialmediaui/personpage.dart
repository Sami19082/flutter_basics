import 'package:flutter/material.dart';

class Personpage extends StatefulWidget {
  String image;
  String name;
  String data;

  Personpage({required this.image, required this.name, required this.data});

  @override
  State<Personpage> createState() => _PersonpageState();
}

class _PersonpageState extends State<Personpage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(widget.image),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name),
            Text(
              "Online",
              style: TextStyle(fontSize: 12, color: Colors.green),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: Text("Today"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300),
            child: Text("Hello?? Where Are you man?"),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300),
            child: InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return SimpleDialog(title: Text(widget.data),
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 22),
                                  child: Text("React",style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.thumb_down)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.heart_broken)),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                                  ],
                                ),
                              ],
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Delete",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Block",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Report",style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ],
                        );
                      });
                },
                child: Text(widget.data)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Text("Hello?? Where Are you man?"),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 400,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Type a message",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    suffixIcon:
                        IconButton(onPressed: () {}, icon: Icon(Icons.send))),
              ),
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
          IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
          IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
        ],
      ),
    );
  }
}
