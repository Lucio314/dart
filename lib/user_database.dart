import 'package:flutter_application_3/user.dart';
import 'package:path/path.dart';
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
    return await openDatabase(join(await getDatabasesPath(), 'User.db'),
        onCreate: (db, version) async {
      await db.execute(
        '''CREATE TABLE User (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT
        );''',
      );
    }, version: 1);
  }

  Future<void> insertUser(User user) async {
    final Database db = await instance.database;
    await db.insert('User', user.toMap());
  }

  Future<List<User>> getUsers() async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('User');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<User?> getUserByUsername(String username) async {
    final Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'User',
      where: 'username = ?',
      whereArgs: [username],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
