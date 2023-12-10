import 'package:flutter/material.dart';
import 'package:flutter_application_3/User.dart';
import 'database_manager.dart'; // Assurez-vous d'avoir correctement importé votre gestionnaire de base de données

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // final UserDatabase dbManager = UserDatabase();

  // Créez les contrôleurs pour les champs TextField
  final TextEditingController UsernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
// ...

Future<List<User>> _getUsersFromDatabase() async {
  return UserDatabase.instance.Users();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Inscription'),
    ),
    body: FutureBuilder<List<User>>(
      future: _getUsersFromDatabase(), // Récupération des utilisateurs depuis la base de données
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Affichage pendant le chargement des données
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Gestion des erreurs
          return Center(child: Text('Erreur de chargement'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Aucune donnée récupérée
          return Center(child: Text('Aucun utilisateur trouvé'));
        } else {
          List<User> Users = snapshot.data!;

          return ListView(
            children: [
              // Votre code existant pour les champs TextField et le bouton d'inscription

              ElevatedButton(
                onPressed: () async {
                  String Username = UsernameController.text;
                  String password = passwordController.text;

                  if (Username.isNotEmpty && password.isNotEmpty) {
                    int nbr = Users.length;
                    User newUser = User(nbr, Username, password);
                    print('object');
                    Users.add(newUser);

                    // Mettre à jour l'interface utilisateur
                    setState(() {
                      // Mettre à jour la liste des utilisateurs
                      snapshot.data = Users;
                    });

                    // Insérer les données dans la base de données
                    await UserDatabase.instance.initDB();
                    await UserDatabase.instance.insertUser(newUser);
                    // Naviguer vers une autre page après l'inscription
                    // Vous pouvez utiliser Navigator pour naviguer vers une autre page, par exemple:
                    // Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // Afficher un message d'erreur si les champs sont vides
                    showDialog(
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
                child: Text('S\'inscrire'),
              ),
            ],
          );
        }
      },
    ),
  );
}

// ...

  @override
  void dispose() {
    // Libérez les contrôleurs lorsqu'ils ne sont plus nécessaires
    UsernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
