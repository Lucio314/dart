import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_application_3/user.dart';
import 'package:flutter_application_3/user_database.dart';

class Authentication {
  static Future<bool> login(String username, String password) async {
    User? user = await UserDatabase.instance.getUserByUsername(username);
    if (user != null) {
      String hashedPassword = sha256.convert(utf8.encode(password)).toString();
      if (user.password == hashedPassword) {
        return true; // Authentification réussie
      }
    }
    return false; // Authentification échouée
  }

  static Future<void> signUp(String username, String password) async {
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    User newUser = User(username: username, password: hashedPassword);
    await UserDatabase.instance.insertUser(newUser);
  }
}
