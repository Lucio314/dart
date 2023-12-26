import 'package:flutter/material.dart';
import 'package:flutter_application_3/authentication.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;
  bool isLoading = false;

  Future<void> signIn() async {
    setState(() {
      error = null; 
      isLoading = true; 
    });

    String username = usernameController.text;
    String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        error = 'Please enter username and password.';
        isLoading = false; 
      });
      return;
    }

    try {
      bool isAuthenticated = await Authentication.login(username, password);
      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          error = 'Invalid username or password.';
          isLoading = false; // Désactivez l'indicateur de chargement si l'authentification échoue
        });
      }
    } catch (e) {
      setState(() {
        error = 'An error occurred. Please try again.';
        isLoading = false; // Désactivez l'indicateur de chargement en cas d'erreur
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
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
              onPressed: isLoading ? null : signIn,
              child: isLoading ? CircularProgressIndicator() : Text('Sign In'),
            ),
            if (error != null) Text(error!, style: TextStyle(color: Colors.red)),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Create an account'),
            ),
          ],
        ),
      ),
    );
  }
}
