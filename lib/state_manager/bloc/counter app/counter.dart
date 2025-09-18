import 'package:classico/state_manager/bloc/counter%20app/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/counter_cubit.dart';
import 'counter_bloc.dart';

void main() {
  runApp(BlocMyApp());
}

class BlocMyApp extends StatelessWidget {
  const BlocMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: Counter(),
      ),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (ctx, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("You Have Pushed the button this many times"),
              Text("${state.count}"),
            ],
          ),
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(IncrementEvent(value: 5));
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            },
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
