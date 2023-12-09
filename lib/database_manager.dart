// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseManager {
//   Database? _database;

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await initDatabase();
//     return _database!;
//   }

//   Future<Database> initDatabase() async {
//     String path = join(await getDatabasesPath(), 'my_database.db');

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute(
//           'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
//         );
//       },
//     );
//   }

//   Future<void> insertUser(String username, String password) async {
//     final db = await database;
//     await db.insert(
//       'users',
//       {'username': username, 'password': password},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final db = await database;
//     return await db.query('users');
//   }
// // }

import 'package:path/path.dart';
import 'package:flutter_application_3/user.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class userDatabase {
  userDatabase._();

  static final userDatabase instance = userDatabase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(join(await getDatabasesPath(), 'user.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY, username TEXT, password TEXT)',
      );
    }, version: 1);
  }

  void insertUser(user user) async {
    final Database db = await database;

    await db.insert('user', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<user>> users() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    List<user> users = List.generate(maps.length, (i) {
      return user.fromMap(maps[i]);
    });

    if (users.isEmpty) {
      for (user user in defaultUser) {
        insertUser(user);
      }
      users = defaultUser;
    }

    return users;
  }

  final List<user> defaultUser = [
    user(5, 'tibo', 'toto'),
  ]; 
}
