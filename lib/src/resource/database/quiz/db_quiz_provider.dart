import 'dart:io';
import 'package:lichamduong/src/resource/model/quiz.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbQuizProvider {
  static Database _database;
  static final DbQuizProvider db = DbQuizProvider._();

  DbQuizProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'quiz_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Quiz('
              'id INTEGER PRIMARY KEY,'
              'cauHoi TEXT,'
              'a TEXT,'
              'b TEXT,'
              'c TEXT,'
              'd TEXT,'
              'dapAn TEXT'
              'giaiThich TEXT,'
              'isvisible TEXT,'
              'uid TEXT,'
              'qtime NUMERIC,'
              'level TEXT,'
              ')');
        });
  }

  // Insert employee on database
  createQuiz(Quiz newQuiz) async {
    await deleteAllQuizs();
    final db = await database;
    final res = await db.insert('Quiz', newQuiz.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllQuizs() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Quiz');

    return res;
  }

  Future<List<Quiz>> getAllQuizs() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM QUIZ");

    List<Quiz> list =
    res.isNotEmpty ? res.map((c) => Quiz.fromJson(c)).toList() : [];

    return list;
  }


}