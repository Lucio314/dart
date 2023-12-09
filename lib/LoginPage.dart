import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

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
                decoration: InputDecoration(
                  hintText: 'Nom d\'utilisateur',
                ),
              ),
              SizedBox(height: 35.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Mot de passe',
                ),
              ),
              SizedBox(height: 45.0),
              ElevatedButton(
                onPressed: () {
                  // Ajouter la logique de connexion ici
                },
                child: Text('Se connecter'),
              ),
              Text('PAS DE COMPTE EXISTANT? '),
              TextButton(onPressed: () {}, child: Text('S\'inscrire'))
            ],
          ),
        ),
      ]),
    );
  }
}
