import 'package:flutter/material.dart';
import 'package:flutter_application_3/user.dart';
import 'database_manager.dart'; // Assurez-vous d'avoir correctement importé votre gestionnaire de base de données

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // final userDatabase dbManager = userDatabase();

  // Créez les contrôleurs pour les champs TextField
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Libérez les contrôleurs lorsqu'ils ne sont plus nécessaires
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inscription'),
        ),
        body: FutureBuilder<List<user>>(
          future: userDatabase.instance.users(),
          builder: (BuildContext context, AsyncSnapshot<List<user>> snapshot) {
            List<user>? users = snapshot.data;
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
                      controller: usernameController,
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
                        // Récupérer les données des contrôleurs
                        String username = usernameController.text;
                        String password = passwordController.text;

                        // Vérifier si les champs ne sont pas vides avant d'insérer dans la base de données
                        if (username.isNotEmpty && password.isNotEmpty) {
                          // Initialise la base de données
                          // await dbManager.initDatabase();
                          print('object');
                          // userDatabase.
                          // // Insère les données dans la base de données
                          // // await dbManager.insertUser(username, password);

                          // // Affiche un message ou navigue vers une autre page après l'inscription
                          // Utilisez Navigator pour naviguer vers une autre page par exemple
                          // Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          // Affiche un message d'erreur si les champs sont vides
                          showDialog(
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
}
