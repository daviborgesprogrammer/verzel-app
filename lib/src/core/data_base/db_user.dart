import 'package:sqflite/sqflite.dart';

import '../../models/user_model.dart';
import 'db_provider.dart';

class UserFields {
  static const String tableName = 'CLIENT';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT';
  static const String intType = 'INTEGER';
  static const String id = 'id';
  static const String name = 'name';
  static const String email = 'email';
  static const String birthDate = 'birthDate';
  static const String cpf = 'cpf';
  static const String zip = 'zip';
  static const String address = 'address';
  static const String number = 'number';
  static const String password = 'password';
}

final class DbUser {
  static Future<void> createTable(Database db) async {
    await db.execute('''
          CREATE TABLE ${UserFields.tableName} (
          ${UserFields.id} ${UserFields.idType},
          ${UserFields.name} ${UserFields.textType},
          ${UserFields.email} ${UserFields.textType},
          ${UserFields.birthDate} ${UserFields.textType},
          ${UserFields.cpf} ${UserFields.textType},
          ${UserFields.zip} ${UserFields.textType},
          ${UserFields.address} ${UserFields.textType},
          ${UserFields.number} ${UserFields.textType},
          ${UserFields.password} ${UserFields.textType}
          )
          ''');
  }

  static Future<User> create(User user) async {
    final db = await DBProvider.i.database;
    final id = await db.insert(UserFields.tableName, user.toMap());
    return user.copyWith(id: () => id);
  }

  static Future<User?> read(int id) async {
    final db = await DBProvider.i.database;
    final result = await db.query(
      UserFields.tableName,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? User.fromMap(result.first) : null;
  }

  static Future<List<User>> readAll() async {
    final db = await DBProvider.i.database;
    final result = await db.query(UserFields.tableName);
    return result.map((json) => User.fromMap(json)).toList();
  }

  static Future<User?> readByEmail(
    ({String? email, String? password}) userData,
  ) async {
    final db = await DBProvider.i.database;
    final result = await db.query(
      UserFields.tableName,
      where: '${UserFields.email} = ?',
      whereArgs: [userData.email],
    );
    return result.isEmpty ? null : User.fromMap(result.first);
  }
}
