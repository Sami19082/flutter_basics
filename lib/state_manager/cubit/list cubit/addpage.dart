import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'listcubit.dart';

class CubitAdd extends StatelessWidget {
  bool isUpdate;
  int mindex = 0;
  String mtitle = "";
  String mdescription = "";

  CubitAdd(
      {super.key,
      this.isUpdate = false,
      this.mindex = 0,
      this.mtitle = "",
      this.mdescription = ""});

  TextEditingController textController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textController.text = mtitle;
    descController.text = mdescription;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit with Map"),
      ),
      body: Column(
        children: [
          Text(isUpdate ? "Update Note" : "Add Note"),
          TextField(
            controller: textController,
          ),
          TextField(
            controller: descController,
          ),
          ElevatedButton(
              onPressed: () {
                if (textController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  var mNote = {
                    "title": textController.text.toString(),
                    "description": descController.text.toString()
                  };

                  if (isUpdate) {
                    BlocProvider.of<ListCubit>(context)
                        .updateNote(mindex, mNote);
                  } else {
                    BlocProvider.of<ListCubit>(context).addNote(mNote);
                  }
                }
                textController.clear();
                descController.clear();
                Navigator.pop(context);
              },
              child: Text(isUpdate ? "Update" : "Add"))
        ],
      ),
    );
  }
}
