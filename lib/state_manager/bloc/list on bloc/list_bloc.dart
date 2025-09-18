import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/list cubit/list_state.dart';
import 'list_event.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListState(mData: [])) {
    on<AddMapEvent>((event, emit) {
      var currState = state.mData;
      currState.add(event.newMap);
      emit(ListState(mData: currState));
    });

    on<FetchAllMap>((event, emit) {
      emit(ListState(mData: state.mData));
    });

    on<EditMap>((event, emit) {
      var currState = state.mData;
      currState[event.index] = event.newMap;
      emit(ListState(mData: currState));
    });

    on<DeleteMap>((event, emit) {
      var currState = state.mData;
      currState.removeAt(event.index);
      emit(ListState(mData: currState));
    });
  }
  }

