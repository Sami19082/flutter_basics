import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../model/note_model.dart';
import '../model/user_model.dart';

class GAppDataBase {
  GAppDataBase._();

  static final GAppDataBase instance = GAppDataBase._();
  Database? db;
  static const String NOTES_TABLE = "notes";
  static const String NOTE_ID = "noteID";
  static const String TITLE = "title";
  static const String DESCRIPTION = "description";

  static const String USER_TABLE = "user";
  static const String USER_ID = "userID";
  static const String USER_NAME = "userName";
  static const String USER_EMAIL = "userEmail";
  static const String USER_PASSWORD = "userPassword";

  Future<Database> initDb() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "notesDb.db");
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASSWORD text )");

      db.execute(
          "create table $NOTES_TABLE ( $NOTE_ID integer primary key autoincrement, $USER_ID integer, $TITLE text, $DESCRIPTION text )");
    });
  }

  Future<Database> getDb() async {
    if (db != null) {
      return db!;
    } else {
      db = await initDb();
      return db!;
    }
  }

  Future<void> addNote(GridNoteModel note) async {
    var userUID = await getUID();
    note.g_user_id = userUID;
    var db = await getDb();
    db.insert(NOTES_TABLE, note.toMap());
  }

  void editNote(GridNoteModel note) async {
    var db = await getDb();
    db.update(NOTES_TABLE, note.toMap(),
        where: "$NOTE_ID = ?", whereArgs: [note.g_note_id]);
  }

  Future<int> getUID () async {
    var prefs = await SharedPreferences.getInstance();
   var uid =  prefs.getInt("userUID")!;
    return uid ?? 0 ;
  }

  void deleteNote(int noteId) async {
    var db = await getDb();
    db.delete(NOTES_TABLE, where: "$NOTE_ID = ?", whereArgs: [noteId]);
  }

  Future<List<GridNoteModel>> fetchNotes() async {
    var userUID = await getUID();
    var db = await getDb();
    List<GridNoteModel> arrNotes = [];
    var data = await db
        .query(NOTES_TABLE, where: "$USER_ID = ?", whereArgs: [userUID]);
    for (Map<String, dynamic> eachNote in data) {
      var noteModel = GridNoteModel.fromMap(eachNote);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }

  Future<bool> createAccount(GridUserModel newUser) async {
    var check = await checkIfUserExisted(newUser.g_user_email);
    if (!check) {
      //create user
      var db = await getDb();
      db.insert(USER_TABLE, newUser.toMap());
      return true;
    } else {
      print("User already existed");
      return false;
    }
  }

  Future<bool> authenticateUser(String email, String password) async {
    var db = await getDb();
    var data = await db.query(USER_TABLE,
        where: "$USER_EMAIL = ? and $USER_PASSWORD = ?",
        whereArgs: [email, password]);
    return data.isNotEmpty;
  }

  Future<bool> checkIfUserExisted(String email) async {
    var db = await getDb();
    var data = await db
        .query(USER_TABLE, where: "$USER_EMAIL = ?", whereArgs: [email]);
    return data.isNotEmpty;
  }
}
