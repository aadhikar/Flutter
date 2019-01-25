import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:note_keeper/models/note.dart';

class DatabaseHelper {
//  The singleton pattern is a design pattern that restricts
// the instantiation of a class to one object.
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

//   Named constructor to create instance of DatabaseHelper
  DatabaseHelper._createInstance();

//  Define all the database COLUMN names along with TABLE name
  String noteTable = "note_table";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

//  Use the factory keyword when implementing a constructor that doesn’t always
// create a new instance of its class.Use the factory keyword when implementing
// a constructor that doesn’t always create a new instance of its class.
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
//       This is executed only once, singleton object
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
//    Get the directory path for both Android and IOS to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

//  Open/Create a database at given path
    var noteDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return noteDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $noteTable('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colTitle TEXT, $colDescription TEXT, '
        '$colPriority INTEGER, $colDate TEXT)');
  }

//  Fetch Operation: Get all Note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;

//    var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
//    Above statement can be re-written as bellow
    var result = await db.query(noteTable, orderBy: '$colPriority ASC');

    return result;
  }

//  Insert Operation: Insert a Note object to database
  Future<int> insertNote(Note note) async {
    Database db = await this.database;
    var result = db.insert(noteTable, note.toMap());
    return result;
  }

//  Update Operation: Update a Note object and save it to database
  Future<int> updatetNote(Note note) async {
    Database db = await this.database;
    var result = db.update(noteTable, note.toMap(),
        where: '$colId = ?', whereArgs: [note.id]);
    return result;
  }

//  Delete Operation: Delete a Note object from database
  Future<int> deletetNote(int id) async {
    Database db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
    return result;
  }

//  Get number of Note objects from database
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.query('SELECT COUNT(*) FROM $noteTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }
}
