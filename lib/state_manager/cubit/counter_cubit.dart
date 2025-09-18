import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(count: 0));

  /// initial state

  /// events
  void increment() {
    emit(CounterState(count: state.count + 1));
  }

  void decrement() {
    if (state.count > 0) {
      emit(CounterState(count: state.count - 1));
    }
  }
}


class CounterState{
  int count; /// here can use multi value
CounterState({required this.count});
}