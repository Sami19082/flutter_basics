import 'package:classico/state_manager/cubit/cubit%20database/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class CubitDb {
  CubitDb._();

  static final CubitDb instance = CubitDb._();
  static final String NOTES_TABLE = "notes";
  static final String NOTE_ID = "noteID";
  static final String TITLE = "title";
  static final String DESCRIPTION = "description";

  Database? database;

  Future<Database> initDb() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "NoteDb.db");
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $NOTES_TABLE ( $NOTE_ID integer primary key autoincrement, $TITLE text, $DESCRIPTION text ) ");
    });
  }

  Future<Database> getDb() async {
    if (database != null) {
      return database!;
    } else {
      database = await initDb();
      return database!;
    }
  }

  Future<void> addNote(CubitNoteModel newNote) async {
    var db = await getDb();
    db.insert(NOTES_TABLE, newNote.toMap());
  }

  Future<void> editNote(CubitNoteModel editNote) async {
    var db = await getDb();
    db.update(NOTES_TABLE, editNote.toMap(),
        where: "$NOTE_ID = ?", whereArgs: [editNote.note_id]);
  }

  Future<void> deleteNote(int id) async {
    var db = await getDb();
    await db.delete(NOTES_TABLE, where: "$NOTE_ID = ?", whereArgs: [id]);
  }

  Future<List<CubitNoteModel>> fetchNotes() async {
    var db = await getDb();
    List<CubitNoteModel> arrNotes = [];
    var data = await db.query(NOTES_TABLE);
    for (Map<String, dynamic> each in data) {
      var noteModel = CubitNoteModel.fromMap(each);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }
}
