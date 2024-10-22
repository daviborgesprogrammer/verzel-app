import 'package:sqflite/sqflite.dart';

import '../../models/task_model.dart';
import 'db_provider.dart';

class TaskFields {
  static const String tableName = 'TASK';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT';
  static const String intType = 'INTEGER';
  static const String id = 'id';
  static const String idUser = 'idUser';
  static const String title = 'title';
  static const String deliveryDate = 'deliveryDate';
  static const String conclusionDate = 'conclusionDate';
  static const String status = 'status';
}

final class DbTask {
  static Future<void> createTable(Database db) async {
    await db.execute('''
          CREATE TABLE ${TaskFields.tableName} (
          ${TaskFields.id} ${TaskFields.idType},
          ${TaskFields.idUser} ${TaskFields.intType},
          ${TaskFields.title} ${TaskFields.textType},
          ${TaskFields.deliveryDate} ${TaskFields.textType},
          ${TaskFields.conclusionDate} ${TaskFields.textType},
          ${TaskFields.status} ${TaskFields.intType}
          )
          ''');
  }

  static Future<Task> create(Task task) async {
    final db = await DBProvider.i.database;
    final id = await db.insert(TaskFields.tableName, task.toMap());
    return task.copyWith(id: () => id);
  }

  static Future<List<Task>> readByUser(int id) async {
    final db = await DBProvider.i.database;
    final result = id == 0
        ? await db.query(TaskFields.tableName)
        : await db.query(
            TaskFields.tableName,
            where: '${TaskFields.idUser} = ?',
            whereArgs: [id],
          );
    return result.isNotEmpty
        ? result.map((json) => Task.fromMap(json)).toList()
        : [];
  }

  static Future<int> delete(int id) async {
    final db = await DBProvider.i.database;
    return db.delete(
      TaskFields.tableName,
      where: '${TaskFields.id} = ?',
      whereArgs: [id],
    );
  }
}
