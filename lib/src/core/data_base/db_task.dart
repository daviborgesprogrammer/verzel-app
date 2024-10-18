import 'package:sqflite/sqflite.dart';

final class DbTask {
  static Future<void> createTable(Database db) async {
    await db.execute('''
          CREATE TABLE ${TaskFields.tableName} (
          ${TaskFields.id} ${TaskFields.idType}
          ${TaskFields.title} ${TaskFields.textType}
          ${TaskFields.deliveryDate} ${TaskFields.textType}
          ${TaskFields.conclusionDate} ${TaskFields.textType}
          ${TaskFields.status} ${TaskFields.intType}
          )
          ''');
  }
}

class TaskFields {
  static const String tableName = 'CLIENT';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String id = '_id';
  static const String title = 'title';
  static const String deliveryDate = 'deliveryDate';
  static const String conclusionDate = 'conclusionDate';
  static const String status = 'status';
}
