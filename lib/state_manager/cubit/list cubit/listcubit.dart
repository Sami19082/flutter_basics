import 'dart:async';
import 'dart:math';

import 'package:classico/state_manager/cubit/list%20cubit/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(mData: []));

  /// add note event
  void addNote(Map<String, dynamic> newNote) {
    emit(ListState(mData: state.mData, isLoading: true));
    Timer(Duration(seconds: 5), () {
      var random = Random().nextInt(100);

      /// handing error
      if (random % 5 == 0) {
        emit(ListState(
            mData: state.mData,
            isLoading: false,
            errorMsg: "Something went wrong",
            isError: true));
      } else {
        var currData = state.mData;
        currData.add(newNote);
        emit(ListState(mData: currData, isLoading: false, isError: false));
      }
    });
  }

  ///update note event
  void updateNote(int index, Map<String, dynamic> updateNote) {
    var currData = state.mData;
    currData[index] = updateNote;
    emit(ListState(mData: currData));
  }

  ///delete note event
  void deleteNote(int index) {
    var currData = state.mData;
    currData.removeAt(index);
    emit(ListState(mData: currData));
  }
}
