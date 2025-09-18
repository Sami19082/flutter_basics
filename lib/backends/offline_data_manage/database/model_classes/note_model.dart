import 'package:classico/backends/offline_data_manage/database/Db.dart';

class NoteModel {
  int note_id;
  int user_id;
  String note_title;
  String note_description;

  NoteModel(
      {required this.note_id,
      required this.note_title,
      required this.note_description,
      required this.user_id});

  ///From Map --> Model
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        note_id: map[AppDataBase.NOTE_ID],
        note_title: map[AppDataBase.TITLE],
        note_description: map[AppDataBase.DESCRIPTION],
        user_id: map[AppDataBase.USER_ID]);
  }

  /// Model --> To Map
  Map<String, dynamic> toMap() {
    return {
      // AppDataBase.NOTE_ID: note_id it is not needed as it is auto incremented //
      AppDataBase.TITLE: note_title,
      AppDataBase.DESCRIPTION: note_description,
      AppDataBase.USER_ID: user_id
    };
  }
}
