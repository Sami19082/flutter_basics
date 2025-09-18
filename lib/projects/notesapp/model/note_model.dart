import '../db/database.dart';

class GridNoteModel {
  int g_note_id;
  int g_user_id;
  String g_note_title;
  String g_note_description;

  GridNoteModel(
      {required this.g_note_id,
      required this.g_note_title,
        required this.g_user_id,
      required this.g_note_description});

  factory GridNoteModel.fromMap(Map<String, dynamic> map) {
    return GridNoteModel(
        g_note_id: map[GAppDataBase.NOTE_ID],
        g_note_title: map[GAppDataBase.TITLE],
        g_user_id: map[GAppDataBase.USER_ID],
        g_note_description: map[GAppDataBase.DESCRIPTION]);
  }

  Map<String, dynamic> toMap() {
    return {
      GAppDataBase.TITLE: g_note_title,
      GAppDataBase.USER_ID: g_user_id,
      GAppDataBase.DESCRIPTION: g_note_description,
    };
  }
}
