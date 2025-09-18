import 'package:classico/state_manager/bloc/counter%20app/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/counter_cubit.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super( CounterState(count: 0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(count: state.count + event.value));
    });

    on<DecrementEvent>((event, emit) {
      if (state.count > 0) {
        emit(CounterState(count: state.count - 1));
      }
    });
  }
}
