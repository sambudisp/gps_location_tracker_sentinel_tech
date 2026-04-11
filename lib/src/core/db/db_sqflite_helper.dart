import 'dart:developer';
import 'package:sqflite/sqflite.dart';
import '../core.dart';

typedef Sql = String;
typedef SqlArgs = List<Object?>?;
typedef SqlQueryResult = List<Map<String, Object?>>;

class DbSqfliteHelper {
  final String? _databasePath;
  Database? _database;

  DbSqfliteHelper([this._databasePath]);

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = _databasePath ?? await DbHelper().getDatabasePath();

    if (databasePath == null) {
      throw Exception('Database path is null');
    }

    return openDatabase(databasePath);
  }

  ///

  Future<int> execRawInsert(Sql sql, [SqlArgs args]) async {
    try {
      return (await database).rawInsert(sql, args);
    } on DatabaseException catch (e) {
      log(e.toString(), name: 'SQL Raw Insert Exception');
      return -1;
    }
  }

  Future<int> execRawUpdate(Sql sql, [SqlArgs args]) async {
    try {
      return (await database).rawUpdate(sql, args);
    } on DatabaseException catch (e) {
      log(e.toString(), name: 'SQL Raw Update Exception');
      return -1;
    }
  }

  Future<int> execRawDelete(Sql sql, [SqlArgs args]) async {
    try {
      return (await database).rawDelete(sql, args);
    } on DatabaseException catch (e) {
      log(e.toString(), name: 'SQL Raw Delete Exception');
      return -1;
    }
  }

  Future<SqlQueryResult> execRawQuery(Sql sql, [SqlArgs args]) async {
    try {
      return (await database).rawQuery(sql, args);
    } on DatabaseException catch (e) {
      log(e.toString(), name: 'SQL Raw Query Exception');
      return [];
    }
  }
}
