import 'package:flutter/material.dart';
import 'package:flutter_application_3/HomePage.dart';
import 'package:flutter_application_3/User.dart';
import 'package:flutter_application_3/database_manager.dart'; // Assurez-vous d'avoir correctement importé votre gestionnaire de base de données

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // final UserDatabase dbManager = UserDatabase();

  // Créez les contrôleurs pour les champs TextField
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: FutureBuilder<List<User>>(
          future: UserDatabase.instance.Users(),
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            // List<User>? Users = snapshot.data;
            return ListView(children: [
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
                    SizedBox(height: 20.0),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Mot de passe',
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        await UserDatabase.instance.initDB();
                        String username = UsernameController.text;
                        String password = passwordController.text;

                        if (username.isNotEmpty && password.isNotEmpty) {
                          List<User> users =
                              await UserDatabase.instance.Users();

                          int userCount = users.length;
                          User newUser = User(userCount, username, password);

                          // Insérer les données dans la base de données
                          UserDatabase.instance.insertUser(newUser);

                          // Rafraîchir l'interface utilisateur avec setState si nécessaire
                          setState(() {
                            // Mettre à jour la liste des utilisateurs affichée
                            users.add(newUser);
                          });

Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);
                        } else {
                          // Afficher un message d'erreur si les champs sont vides
                          showDialog(
                            // ... votre code pour l'affichage de la boîte de dialogue d'erreur
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Erreur'),
                                content:
                                    Text('Veuillez remplir tous les champs.'),
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
                      child: Text('S\'inscrire'),
                    ),
                  ],
                ),
              ),
            ]);
          },
        ));
  }

  @override
  void dispose() {
    // Libérez les contrôleurs lorsqu'ils ne sont plus nécessaires
    UsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
