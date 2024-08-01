import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterInCreased>(_onCounterIncreased);

    on<CounterReset>(_onCounterReset);
  }

  void _onCounterIncreased(CounterInCreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.valueincrement,
        transactionCount: state.transactionCount + 1));
  }

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }

  void inCreaseBy([int value = 1]) {
    add(CounterInCreased(value));
  }

  void resetCounter() {
    add(CounterReset());
  }
}
