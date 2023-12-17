import 'package:flutter/material.dart';
import 'package:flutter_application_3/HomePage.dart';
import 'package:flutter_application_3/LoginPage.dart';
import 'package:flutter_application_3/User.dart';
import 'package:flutter_application_3/database_manager.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username.isNotEmpty && password.isNotEmpty) {
      List<User> users = await UserDatabase.instance.getUsers();

      int userCount = users.length;
      User newUser = User(userCount, username, password);

      UserDatabase.instance.insertUser(newUser);

      setState(() {
        users.add(newUser);
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      _showErrorDialog('Veuillez remplir tous les champs.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inscription'),
      ),
      body: Padding(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'assets/login.png',
              width: 100,
              height: 200,
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Nom d\'utilisateur',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Mot de passe',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _signup,
              child: Text('S\'inscrire'),
            ),
            Text('COMPTE EXISTANT? '),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}
