import 'package:classico/state_manager/cubit/cubit%20database/secpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'cubitstate.dart';

void main() {
  runApp(
    BlocProvider(
      create: (ctx) => CubitClass(),
      child: CubitMyApp(),
    ),
  );
}

class CubitMyApp extends StatelessWidget {
  const CubitMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CubitDb(),
    );
  }
}

class CubitDb extends StatelessWidget {
  const CubitDb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes App with Cubit"),
          centerTitle: true,
        ),
        body: BlocBuilder<CubitClass, NoteState>(builder: (ctx, state) {
          return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => Secpage(
                                isUpdate: true,
                                id: state.notes[index].note_id)));
                  },
                  title: Text(state.notes[index].title),
                  subtitle: Text(state.notes[index].description),
                );
              });
        }),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => Secpage(isUpdate: false, id: 0)));
        }));
  }
}
