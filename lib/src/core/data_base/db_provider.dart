import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'db_task.dart';
import 'db_user.dart';

class DBProvider {
  static DBProvider? _instance;

  DBProvider._();

  static DBProvider get i => _instance ??= DBProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, 'verzel.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await DbUser.createTable(db);
        await DbTask.createTable(db);
      },
    );
  }
}
