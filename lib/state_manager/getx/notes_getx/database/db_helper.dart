import 'package:classico/state_manager/getx/notes_getx/models/notesModel.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper extends GetxController {
  static final DbHelper instance = DbHelper();
  Database? database;
  static const NoteTable = "note";
  static const ColumnId = "id";
  static const ColumnTitle = "title";
  static const ColumnDescription = "description";

  Future<Database> initDb() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "notes.db");
    Database database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE $NoteTable ( $ColumnId INTEGER PRIMARY KEY AUTOINCREMENT, $ColumnTitle TEXT, $ColumnDescription TEXT )");
    });
    return database;
  }

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      return await initDb();
    }
  }

  Future<int> addNotes(NotesModel note) async {
    Database db = await getDb();
    var result = await db.insert(NoteTable, {
      ColumnTitle: note.title,
      ColumnDescription: note.description,
    });
    return result;
  }

  Future<void> editNote(NotesModel updateNote) async {
    var db = await getDb();
    await db.update(
        NoteTable,
        {
          ColumnTitle: updateNote.title,
          ColumnDescription: updateNote.description,
        },
        where: '$ColumnId = ?',
        whereArgs: [updateNote.noteID]);
  }

  Future<void> deleteNote(int id) async {
    var db = await getDb();
    await db.delete(NoteTable, where: '$ColumnId = ?', whereArgs: [id]);
  }

  Future<List<NotesModel>> getNotes() async {
    Database db = await getDb();
    var result = await db.query(NoteTable);
    return result.map((e) => NotesModel.fromMap(e)).toList();
  }
}
