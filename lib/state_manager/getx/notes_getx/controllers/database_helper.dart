import 'package:classico/state_manager/getx/notes_getx/database/db_helper.dart';
import 'package:get/get.dart';
import '../models/notesModel.dart';

class DataBaseHelper extends GetxController {
  var notes = <NotesModel>[].obs;
  final DbHelper dbHelper = Get.put(DbHelper());

  Future<void> addNotes(NotesModel note) async {
    await dbHelper.addNotes(note);
    notes.add(note);
  }

  Future<void> deleteNotes(int id) async {
    await dbHelper.deleteNote(id);
    notes.remove(notes.firstWhere((element) => element.noteID == id));
  }

  Future<void> updateNotes(NotesModel note) async {
    await dbHelper.editNote(note);
    notes[notes.indexWhere((element) => element.noteID == note.noteID)] = note;
  }

  Future<void> getNotes() async {
    await dbHelper.initDb();
    notes.assignAll(await dbHelper.getNotes());
  }
}
