import 'package:classico/state_manager/cubit/cubit%20database/cubitdb.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubitstate.dart';
import 'model.dart';

class CubitClass extends Cubit<NoteState> {
  CubitClass() : super(NoteState.initial());

  Future<void> fetchNotes() async {
    try {
      var notes = await CubitDb.instance.fetchNotes();
      emit(NoteState(notes: notes));
    } catch (e) {
      emit(NoteState(notes: state.notes, error: "Error"));
    }
  }

  Future<void> addNotes(CubitNoteModel newNote) async {
    try {
      await CubitDb.instance.addNote(newNote);
      fetchNotes();
    } catch (e) {
      emit(NoteState(notes: state.notes, error: "Error while adding"));
    }
  }

  Future<void> editNotes(CubitNoteModel editNote) async {
    try {
      await CubitDb.instance.editNote(editNote);
      fetchNotes();
    } catch (e) {
      emit(NoteState(notes: state.notes, error: "Error while editing"));
    }
  }

  Future<void> deleteNotes(int id) async {
    try {
      await CubitDb.instance.deleteNote(id);
      fetchNotes();
    } catch (e) {
      emit(NoteState(notes: state.notes, error: "Error while deleting"));
    }
  }
}
