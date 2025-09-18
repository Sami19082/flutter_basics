import 'package:classico/projects/chatui/socialmediaui/personpage.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chatList = [
      {
        'name': "Terry",
        'image': "lib/assets/person.png",
        "data": "Hello",
        "time": "10:00",
        "count": "0",
      },
      {
        'name': "Veronica",
        'image': "lib/assets/person.png",
        "data": "Coming soon",
        "time": "01:00",
        "count": "1",
      },
      {
        'name': "Sagar",
        'image': "lib/assets/person.png",
        "data": "Yellow paper needed",
        "time": "07:00",
        "count": "0",
      },
      {
        'name': "Yash",
        'image': "lib/assets/person.png",
        "data": "Bro help me!!!",
        "time": "03:00",
        "count": "1",
      },
      {
        'name': "Rajeev",
        'image': "lib/assets/person.png",
        "data": "Where are you",
        "time": "02:00",
        "count": "1",
      },
      {
        'name': "Marshel",
        'image': "lib/assets/person.png",
        "data": "Coming for the party?",
        "time": "08:00",
        "count": "1",
      },
      {
        'name': "Prakash",
        'image': "lib/assets/person.png",
        "data": "Come Fast",
        "time": "11:00",
        "count": "0",
      },
      {
        'name': "Yuvraj",
        'image': "lib/assets/person.png",
        "data": "Babai come come !",
        "time": "06:00",
        "count": "0",
      },
      {
        'name': "Ritik Kumar",
        'image': "lib/assets/person.png",
        "data": "Client is coming",
        "time": "09:00",
        "count": "0",
      },
      {
        'name': "Sami",
        'image': "lib/assets/person.png",
        "data": "Credited Thank!",
        "time": "05:00",
        "count": "1",
      },

    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Mengobrol"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 35,
                      backgroundColor: Colors.grey.shade200,
                      child: Icon(Icons.add),
                    ),
                    Text("Add Story",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 500,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                maxRadius: 35,
                                backgroundColor: Colors.white10,
                                child: Image.asset(chatList[index]['image']),
                              ),
                              Text(chatList[index]['name'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Chats",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: ListView.builder(
                itemCount: chatList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return  Personpage(image: chatList[index]['image'], name: chatList[index]['name'],data: chatList[index]['data'],);
                      }));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade200,
                      child: Image.asset(chatList[index]['image']),
                    ),
                    title: Text(
                      chatList[index]["name"],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: chatList[index]["count"] == "0"
                        ? Text(chatList[index]["data"])
                        : Text(
                            chatList[index]["data"],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                    trailing: InkWell(

                      child: Column(
                        children: [
                          Text(chatList[index]["time"]),
                          CircleAvatar(
                            backgroundColor: Colors.yellow,
                            maxRadius: 11,
                            child: chatList[index]["count"] == "0"
                                ? Container(color: Colors.white)
                                : Text(
                                    chatList[index]["count"],
                                    style: TextStyle(color: Colors.black),
                                  ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
          TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  fixedSize: Size(200, 20)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return SimpleDialog(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.messenger_outline),
                                  SizedBox.square(
                                    dimension: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New Chat",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Create New Chat"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.contact_mail_outlined),
                                  SizedBox.square(
                                    dimension: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New Contact",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Add Contact To Start A New Chat"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.group_outlined),
                                  SizedBox.square(
                                    dimension: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "New Community",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Join Community Around You"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Text(" +  New Chat")),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ]),
      ),
    );
  }
}
