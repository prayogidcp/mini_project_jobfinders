import 'package:mini_project/models/review_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = "review";

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'review_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY,
          name TEXT, email TEXT, suggestion TEXT
          )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertReview(ReviewModel reviewModel) async {
    final Database db = await database;
    await db.insert(_tableName, reviewModel.toMap());
    print('Data saved');
  }

  Future<List<ReviewModel>> getReview() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => ReviewModel.fromMap(res)).toList();
  }

  Future<ReviewModel> getReviewById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    return results.map((res) => ReviewModel.fromMap(res)).first;
  }

  Future<void> deleteReview(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
