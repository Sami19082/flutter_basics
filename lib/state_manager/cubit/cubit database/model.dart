import 'package:classico/state_manager/cubit/cubit%20database/cubitdb.dart';

class CubitNoteModel {
  int note_id;
  String title;
  String description;

  CubitNoteModel(
      {required this.note_id, required this.title, required this.description});

  factory CubitNoteModel.fromMap(Map<String, dynamic> map) {
    return CubitNoteModel(
        note_id: map[CubitDb.NOTE_ID],
        title: map[CubitDb.TITLE],
        description: map[CubitDb.DESCRIPTION]);
  }

  Map<String, dynamic> toMap() {
    return {CubitDb.TITLE: title, CubitDb.DESCRIPTION: description};
  }
}
