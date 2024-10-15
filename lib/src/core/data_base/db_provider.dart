import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/user_model.dart';

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
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE CLIENT (id INTEGER PRIMARY KEY, name TEXT,email TEXT, birthDate TEXT,cpf TEXT,zip TEXT, address TEXT,number INTEGER,password TEXT )',
        );
      },
    );
  }

  Future<int> insert(User user) async {
    final db = await database;
    final table = await db.rawQuery('SELECT MAX(id)+1 as id FROM CLIENT');
    final int id = table.first['id'] != null ? table.first['id'] as int : 1;
    return db.rawInsert(
        'INSERT INTO CLIENT (id,name, email,birthDate, cpf, zip, address,number,password) VALUES (?,?,?,?,?,?,?,?,?)',
        [
          id,
          user.name,
          user.email,
          user.birthdate,
          user.cpf,
          user.zip,
          user.address,
          user.number,
          user.password,
        ]);
  }

  Future<User?> get(int id) async {
    final db = await database;
    final res = await db.query('Client', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }

  Future<User?> getByEmail(({String? email, String? password}) userData) async {
    final db = await database;
    final res = await db.query(
      'Client',
      where: 'email = ?',
      whereArgs: [userData.email],
    );
    return res.isEmpty ? null : User.fromMap(res.first);
  }

  // getClient(int id) async {
  //   final db = await database;
  //   var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
  //   return res.isNotEmpty ? Client.fromMap(res.first) : null;
  // }

  // blockOrUnblock(Client client) async {
  //   final db = await database;
  //   Client blocked = Client(
  //       id: client.id,
  //       firstName: client.firstName,
  //       lastName: client.lastName,
  //       blocked: !client.blocked);
  //   var res = await db.update("Client", blocked.toMap(),
  //       where: "id = ?", whereArgs: [client.id]);
  //   return res;
  // }

  // updateClient(Client newClient) async {
  //   final db = await database;
  //   var res = await db.update("Client", newClient.toMap(),
  //       where: "id = ?", whereArgs: [newClient.id]);
  //   return res;
  // }

  // Future<List<Client>> getBlockedClients() async {
  //   final db = await database;

  //   print("works");
  //   // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
  //   var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

  //   List<Client> list =
  //       res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
  //   return list;
  // }

  // Future<List<Client>> getAllClients() async {
  //   final db = await database;
  //   var res = await db.query("Client");
  //   List<Client> list =
  //       res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
  //   return list;
  // }

  // deleteClient(int id) async {
  //   final db = await database;
  //   return db.delete("Client", where: "id = ?", whereArgs: [id]);
  // }

  // deleteAll() async {
  //   final db = await database;
  //   db.rawDelete("Delete * from Client");
  // }
}
