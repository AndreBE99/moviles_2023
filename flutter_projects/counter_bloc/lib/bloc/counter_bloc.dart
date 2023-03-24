import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  CounterBloc() : super(CounterInitial()) {
    on<ResetEvent>(_reset);
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  FutureOr<void> _reset(event, emit) {
    _counter = 0;
    emit(JuanState(counter: _counter));
  }

  FutureOr<void> _increment(event, emit) {
    _counter++;
    emit(JuanState(counter: _counter));
  }

  FutureOr<void> _decrement(event, emit) {
    _counter--;
    emit(JuanState(counter: _counter));
  }
}
