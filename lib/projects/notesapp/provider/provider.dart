import 'package:classico/projects/notesapp/db/database.dart';
import 'package:classico/projects/notesapp/model/note_model.dart';
import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  GAppDataBase db;

  NoteProvider({required this.db});

  List<GridNoteModel> _arrNotes = [];

  List<GridNoteModel> getNotes() => _arrNotes;

  void getAllNotes() async {
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }

  void addNote(GridNoteModel newNote) async {
    await db.addNote(newNote);
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }

  void editNote( GridNoteModel note) async {
    db.editNote(note);
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }

  void deleteNote( int noteId) async {
    db.deleteNote(noteId);
    _arrNotes = await db.fetchNotes();
    notifyListeners();
  }
}
