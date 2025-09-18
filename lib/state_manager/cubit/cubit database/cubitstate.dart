import 'package:classico/state_manager/cubit/cubit%20database/model.dart';
class NoteState {
  List<CubitNoteModel> notes;
  String? error;

  NoteState({required this.notes, this.error});

  factory NoteState.initial() {
    return NoteState(notes: [], error: "Error");
  }

  NoteState copyWith({List<CubitNoteModel>? notes, String? error}) {
    return NoteState(notes: notes ?? this.notes, error: error ?? this.error);
  }

}
