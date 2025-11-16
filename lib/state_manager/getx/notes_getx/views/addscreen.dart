import 'package:classico/state_manager/getx/notes_getx/controllers/database_helper.dart';
import 'package:classico/state_manager/getx/notes_getx/models/notesModel.dart';
import 'package:classico/state_manager/getx/notes_getx/views/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addscreen extends StatefulWidget {
  bool isEdit = false;
  NotesModel? notesModel;

  Addscreen({Key? key, this.isEdit = false, this.notesModel}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  final DataBaseHelper dataBaseHelper = Get.put(DataBaseHelper());
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if(widget.isEdit == true){
      titleController.text = widget.notesModel!.title;
      descController.text = widget.notesModel!.description;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Add Data Screen"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            UiHelper.CustomTextField(
                titleController, "Enter Title", Icons.title),
            UiHelper.CustomTextField(
                descController, "Enter Description", Icons.description),
            ElevatedButton(
              onPressed: () {
                if (widget.isEdit == false) {
                  final newNote = NotesModel(
                      title: titleController.text,
                      description: descController.text,
                      noteID: 0);
                  dataBaseHelper.addNotes(newNote);
                } else {
                  final updatedNote = NotesModel(
                      title: titleController.text,
                      description: descController.text,
                      noteID: widget.notesModel!.noteID);
                  dataBaseHelper.updateNotes(updatedNote);
                }
                Get.back();
              },
              child: Text("Save"),
            )
          ],
        ));
  }
}
