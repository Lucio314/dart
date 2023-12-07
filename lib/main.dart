import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_3/GlobalScaffold.dart';
import 'package:flutter_application_3/HomePage.dart'; // Importez la page d'accueil que vous avez créée précédemment
import 'package:flutter_application_3/Currency.dart'; // Importez les autres pages nécessaires
import 'package:flutter_application_3/Distance.dart';
import 'package:flutter_application_3/Mass.dart';
import 'package:flutter_application_3/Temperature.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      initialRoute: '/', // Page initiale
      routes: {
        '/home': (context) => GlobalScaffold(
              body: HomePage(),
            ),
        '/mass_converter': (context) => GlobalScaffold(
              body: MassConverter(title: 'Masse'),
            ),
        '/distance_converter': (context) => GlobalScaffold(
              body: DistanceConverter(title: 'distance'),
            ),
        '/currency_converter': (context) => GlobalScaffold(
              body: CurrencyConverter(title: 'Devises'),
            ),
        '/temperature_converter': (context) => GlobalScaffold(
              body: TemperatureConverter(title: 'Température'),
            ),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushReplacementNamed('/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/app.png'),
            SizedBox(
              height: 10,
              width: 10,
            ),
            SpinKitFadingCircle(
              color: const Color.fromARGB(255, 5, 7, 8),
              size: 80.0,
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GlobalScaffold(
                            body: DistanceConverter(title: 'home'),
                          )),
                );
              },
            ),
            ListTile(
              title: Text('Distance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GlobalScaffold(
                            body: DistanceConverter(title: 'distance'),
                          )),
                );
              },
            ),
            ListTile(
              title: Text('Masse'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GlobalScaffold(
                            body: MassConverter(title: 'mass'),
                          )),
                );
              },
            ),
            ListTile(
              title: Text('Température'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GlobalScaffold(
                            body: TemperatureConverter(title: 'temperature'),
                          )),
                );
              },
            ),
            ListTile(
              title: Text('Devises'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GlobalScaffold(
                            body: CurrencyConverter(title: 'devise'),
                          )),
                );
              },
            ),
          ],
        ),
      ),
      body: HomePage(),
    );
  }
}
