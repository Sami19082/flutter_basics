import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_cubit.dart';
import 'nextpage.dart';

void main() {
  runApp(BlocProvider(create: (context) => CounterCubit(), child: Counter()));
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Text("${state.count}");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // BlocProvider.of<CounterCubit>(context).increment();
          // context.read<CounterCubit>().increment();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NextPages()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
