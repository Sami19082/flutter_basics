import 'package:classico/state_manager/getx/notes_getx/controllers/database_helper.dart';
import 'package:classico/state_manager/getx/notes_getx/models/notesModel.dart';
import 'package:classico/state_manager/getx/notes_getx/views/addscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    /// to use getx use GetMaterialApp
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final DataBaseHelper dataController = Get.put(DataBaseHelper());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dataController.getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('Notes'),
          ),
          body: ListView.builder(
              itemCount: dataController.notes.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: Text("${index + 1}"),
                  title: Text(dataController.notes[index].title),
                  subtitle: Text(dataController.notes[index].description),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.to(Addscreen(isEdit: true, notesModel: dataController.notes[index]));
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            dataController.deleteNotes(
                                dataController.notes[index].noteID!);
                          },
                          icon: Icon(Icons.delete)),
                    ],
                  ),
                );
              }),
          floatingActionButton: FloatingActionButton(onPressed: () {
            /// also use for navigation
            /// to for navigator to push
            /// to use push replacement offAll is used
            Get.to(Addscreen());
          }),
        ));
  }
}
