import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlocCounterView(),
    );
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void inCreasedCounterBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>().add(CounterInCreased(value));
    context.read<CounterBloc>().inCreaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('Bloc Counter: ${counterBloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
              onPressed: () => context.read<CounterBloc>().resetCounter(),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) {
          return Text('Counter value: ${counterBloc.state.counter}');
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => inCreasedCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              onPressed: () => inCreasedCounterBy(context, 2),
              heroTag: '2',
              child: const Text('+2')),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              onPressed: () => inCreasedCounterBy(context),
              heroTag: '3',
              child: const Text('+1')),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
