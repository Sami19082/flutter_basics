import 'package:classico/state_manager/getx/notes_getx/database/db_helper.dart';

class NotesModel {
  int? noteID;
  String title;
  String description;

  NotesModel(
      {required this.noteID, required this.title, required this.description});

  factory NotesModel.fromMap(Map<String, dynamic> map) {
    return NotesModel(
        noteID: map[DbHelper.ColumnId],
        title: map[DbHelper.ColumnTitle],
        description: map[DbHelper.ColumnDescription]);
  }

  Map<String, dynamic> toMap() {
    return {
      DbHelper.ColumnId: noteID,
      DbHelper.ColumnTitle: title,
      DbHelper.ColumnDescription: description
    };
  }
}
