import 'package:classico/backends/offline_data_manage/database/model_classes/note_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Db.dart';

class Screenpage extends StatefulWidget {
  const Screenpage({super.key});

  @override
  State<Screenpage> createState() => _ScreenpageState();
}

class _ScreenpageState extends State<Screenpage> {
  late AppDataBase db;
  int? uID = 0;
  List<NoteModel> notes = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    db = AppDataBase.instance;
   getUserId();
    super.initState();
  }

  void getAllNotes() async {
    notes = await db.fetchNotes(uID!);
    setState(() {});
  }

  void getUserId() async {
    var prefs = await SharedPreferences.getInstance();
    uID = prefs.getInt("user_id");
    getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            var currData = notes[index];
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text(currData.note_title),
              subtitle: Text(currData.note_description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        callMyBottomSheet(
                            isUpdate: true,
                            title: currData.note_title,
                            description: currData.note_description,
                            userID: uID!,
                            id: currData.note_id);
                      },
                      icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                  title:
                                      Text("Are you sure you want to delete?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No")),
                                    TextButton(
                                        onPressed: () {
                                          db.deleteNote(currData.note_id);
                                          getAllNotes();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes"))
                                  ]);
                            });
                      },
                      icon: Icon(Icons.delete)),
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          callMyBottomSheet();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void callMyBottomSheet(
      {bool isUpdate = false,
      String title = "",
      String description = "",
      int userID = 0,
      int id = 0}) {
    titleController.text = title;
    descriptionController.text = description;
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: 250,
            width: 420,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isUpdate ? "Update Note Here!" : "Add Note Here!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                        hintText: "Title",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                          hintText: "Description",
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            //add note here
                            if (titleController.text.isNotEmpty ||
                                descriptionController.text.isNotEmpty) {
                              if (isUpdate) {
                                db.editNote(NoteModel(
                                    note_id: id,
                                    note_title: titleController.text.toString(),
                                    note_description:
                                        descriptionController.text.toString(),
                                    user_id: userID));
                              } else {
                                db.addNote(NoteModel(
                                    note_id: 0,
                                    note_title: titleController.text.toString(),
                                    note_description:
                                        descriptionController.text.toString(),
                                    user_id: uID!));
                              }
                              Navigator.pop(context);
                              getAllNotes();
                            }
                          },
                          child: Text(isUpdate ? "Update" : "Save")),
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Cancel"))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
