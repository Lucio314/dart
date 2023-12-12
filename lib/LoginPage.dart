import 'package:flutter/material.dart';
import 'package:flutter_application_3/HomePage.dart';
import 'package:flutter_application_3/SignupPage.dart';
import 'package:flutter_application_3/User.dart';
import 'package:flutter_application_3/database_manager.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

final TextEditingController UsernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: ListView(children: [
        Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Image ajoutée pour la stylisation de la page
              Image.asset(
                'assets/login.png',
                width: 100, // Ajustez la largeur selon votre design
                height: 200, // Ajustez la hauteur selon votre design
              ),
              SizedBox(height: 10.0),
              TextField(
                controller: UsernameController,
                decoration: InputDecoration(
                  hintText: 'Nom d\'utilisateur',
                ),
              ),
              SizedBox(height: 35.0),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                ),
              ),
              SizedBox(height: 45.0),
              ElevatedButton(
                onPressed: () async {
                  String username = UsernameController.text;
                  String password = passwordController.text;
                  if (username.isNotEmpty && password.isNotEmpty) {
                    List<User> users = await UserDatabase.instance.Users();

                      bool trouve = false; 
                    
                    for (var element in users) {
                      if ( element.username == username && element.password == password) {
                        trouve = true;
                      }
                    }

                    if (trouve) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      showDialog(
                      // ... votre code pour l'affichage de la boîte de dialogue d'erreur
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erreur'),
                          content: Text('utilisateur inexistant !'),
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
                    
                    setState(() {
                    });

                    
                  } else {
                    // Afficher un message d'erreur si les champs sont vides
                    showDialog(
                      // ... votre code pour l'affichage de la boîte de dialogue d'erreur
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erreur'),
                          content: Text('Veuillez remplir tous les champs.'),
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
                },
                child: Text('Se connecter'),
              ),
              Text('PAS DE COMPTE EXISTANT? '),
              TextButton(onPressed: () {
                 Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupPage()),
                      );
              }, child: Text('S\'inscrire'))
            ],
          ),
        ),
      ]),
    );
  }
}
