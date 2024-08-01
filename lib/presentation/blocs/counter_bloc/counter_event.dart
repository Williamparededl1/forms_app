part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class CounterInCreased extends CounterEvent {
  final int valueincrement;
  const CounterInCreased(this.valueincrement);
}

class CounterReset extends CounterEvent {}
