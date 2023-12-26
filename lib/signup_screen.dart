import 'package:flutter/material.dart';
import 'package:flutter_application_3/authentication.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;

  Future<void> signUp() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        error = 'Please enter username and password.';
      });
      return;
    }

    try {
      // Il est bon de montrer une indication de chargement pendant l'inscription
      // Utilisez un CircularProgressIndicator par exemple.
      // Vous pouvez également désactiver le bouton pendant le chargement pour éviter les envois multiples.
      // Ici, je vais laisser cette partie à votre mise en œuvre.
      
      await Authentication.signUp(username, password);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      setState(() {
        error = 'Sign up failed. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: signUp,
              child: Text('Sign Up'),
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  error!,
                  style: TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
