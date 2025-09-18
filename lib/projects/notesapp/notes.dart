import 'package:classico/projects/notesapp/provider/provider.dart';
import 'package:classico/projects/notesapp/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'db/database.dart';
import 'model/note_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        NoteProvider(db: GAppDataBase.instance);
      },
      child: const Myapp()));
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesHomePage(),
    );
  }
}

class NotesHomePage extends StatefulWidget {
  @override
  State<NotesHomePage> createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  TextEditingController title_Controller = TextEditingController();

  TextEditingController description_Controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NoteProvider>().getAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Notes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
      ),
      backgroundColor: Colors.black,
      body: Consumer<NoteProvider>(builder: (ctx, provider, child) {
        var notes = provider.getNotes();
        return notes.isEmpty
            ? Center(child: Text("No Notes Found"))
            : GridView.builder(
                itemCount: notes.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(notes[index].g_note_title),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(notes[index].g_note_description))
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
      }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.black,
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
