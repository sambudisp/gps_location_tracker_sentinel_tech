import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String dbFileName = 'location_tracker_sentinel_tech.db';

class DbHelper {
  static DbHelper? _dbHelper;

  DbHelper._instance() {
    _dbHelper = this;
  }

  factory DbHelper() => _dbHelper ?? DbHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasePath();

    return await openDatabase(
      dbPath,
      version: 1,
      singleInstance: false,
      onConfigure: (db) async {
        await db.execute("PRAGMA foreign_keys = ON");
      },
      onCreate: (db, version) async {
        await _onCreate(db, version);
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS `tracked_location` (
            `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `started_time` TEXT NOT NULL,
            `stopped_time` TEXT,
            `duration` INTEGER
          )
    ''');
    await db.execute('''
          CREATE TABLE IF NOT EXISTS `tracked_location_detail` (
            `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
            `parent_id` INTEGER NOT NULL,
            `latitude` REAL NOT NULL,
            `longitude` REAL NOT NULL,
            `timestamp` TEXT NOT NULL,
            `accuracy` TEXT NOT NULL,
            FOREIGN KEY (`parent_id`) REFERENCES `tracked_location` (`id`) 
              ON UPDATE NO ACTION ON DELETE CASCADE
          )
    ''');
  }

  Future<String> getDatabasePath() async {
    Directory dir = await getApplicationDocumentsDirectory();
    return join(dir.path, dbFileName);
  }
}
