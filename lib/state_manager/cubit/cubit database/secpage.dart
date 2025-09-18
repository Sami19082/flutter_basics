import 'package:classico/state_manager/cubit/cubit%20database/cubit.dart';
import 'package:classico/state_manager/cubit/cubit%20database/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Secpage extends StatelessWidget {
bool isUpdate;
int id;
  Secpage({super.key, required this.isUpdate, required this.id});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CubitClass>(context).fetchNotes();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text( isUpdate ? "Update Note" : "Notes App"),
          TextField(controller: titleController),
          TextField(controller: descriptionController),
          ElevatedButton(
              onPressed: () {
                if (isUpdate) {
                  titleController.text ;
                  descriptionController.text ;
                  context.read<CubitClass>().editNotes(CubitNoteModel(
                      note_id: id,
                      title: titleController.text,
                      description: descriptionController.text));
                } else {
                  context.read<CubitClass>().addNotes(CubitNoteModel(
                      note_id: 0,
                      title: titleController.text,
                      description: descriptionController.text));
                }
              },
              child: Text("Add Note"))
        ],
      ),
    );
  }
}
