import 'package:classico/backends/offline_data_manage/database/model_classes/note_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'model_classes/usermodel.dart';

class AppDataBase {
  //private constructor(Singleton)
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();
  Database? _database;
  static const String NOTES_TABLE = "notes";
  static const String NOTE_ID = "noteID";
  static const String TITLE = "title";
  static const String DESCRIPTION = "description";

  // user userID here also //  as foreign key ...!!!

  // user table
  static final String USER_TABLE = "user";
  static final String USER_ID = "userID";
  static final String USER_NAME = "userName";
  static final String USER_EMAIL = "userEmail";
  static final String USER_PASSWORD = "userPassword";

  Future<Database> initDB() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "notesDb.db");
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      //create all tables here with query
      //create user table
      db.execute(
          "create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASSWORD text )");
      //create notes table
      db.execute(
          "create table $NOTES_TABLE ( $NOTE_ID integer primary key autoincrement, $USER_ID integer, $TITLE text, $DESCRIPTION text )");
    });
  }

  Future<Database> getDb() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }

  void addNote(NoteModel newNote) async {
    var db = await getDb();
    db.insert(NOTES_TABLE, newNote.toMap());
  }

  void editNote(NoteModel updateNote) async {
    var db = await getDb();
    db.update(NOTES_TABLE, updateNote.toMap(),
        where: "$NOTE_ID = ?", whereArgs: [updateNote.note_id]);
  }

  void deleteNote(int noteId) async {
    var db = await getDb();
    db.delete(NOTES_TABLE, where: "$NOTE_ID = ?", whereArgs: [noteId]);
  }

  //queries for user table
  ///////////////////////////////////////////////////////////////////
  //Functions for signup
  Future<bool> createAccount(UserModel newUser) async {
    var check = await checkIfUserExisted(newUser.user_email);
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

  Future<bool> checkIfUserExisted(String email) async {
    var db = await getDb();
    var data = await db
        .query(USER_TABLE, where: "$USER_EMAIL = ?", whereArgs: [email]);
    return data.isNotEmpty;
  }
////////////////////////////////////////////////////////////////////////

  //login then after all the checking
  // Functions for login
  Future<bool> authenticateUser(String email, String password) async {
    var db = await getDb();
    var data = await db.query(USER_TABLE,
        where: "$USER_EMAIL = ? and $USER_PASSWORD = ?",
        whereArgs: [email, password]);

    if(data.isNotEmpty){
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt("user_id", UserModel.fromMap(data[0]).user_id);
    }

    return data.isNotEmpty;
  }

  // Future<List<Map<String, dynamic>>> fetchNotes() async {
  //   var db = await getDb();
  //   var data = await db.query(NOTES_TABLE);
  //   return data;
  // }

  Future<List<NoteModel>> fetchNotes(int userUID) async {
    var db = await getDb();
    List<NoteModel> arrNotes = [];
    var data = await db.query(NOTES_TABLE, where: "$USER_ID = ?", whereArgs: [userUID]);
    for (Map<String, dynamic> eachNote in data) {
      var noteModel = NoteModel.fromMap(eachNote);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }
}
