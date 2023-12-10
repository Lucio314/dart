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
//           'CREATE TABLE Users(id INTEGER PRIMARY KEY, Username TEXT, password TEXT)',
//         );
//       },
//     );
//   }

//   Future<void> insertUser(String Username, String password) async {
//     final db = await database;
//     await db.insert(
//       'Users',
//       {'Username': Username, 'password': password},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getUsers() async {
//     final db = await database;
//     return await db.query('Users');
//   }
// // }

import 'package:path/path.dart';
import 'package:flutter_application_3/User.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  UserDatabase._();

  static final UserDatabase instance = UserDatabase._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(join(await getDatabasesPath(), 'User.db'),
        onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE User(id INTEGER PRIMARY KEY, Username TEXT, password TEXT)',
      );
    }, version: 1);
  }

  void insertUser(User User1) async {
    final Database db = await database;

    await db.insert('User', User1.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> Users() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('User');
    List<User> Users = List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });

    if (Users.isEmpty) {
      for (User currentUser in defaultUser) {
        insertUser(currentUser);
      }
      Users = defaultUser;
    }

    return Users;
  }

  final List<User> defaultUser = [
    User(5, 'tibo', 'toto'),
  ]; 
}
