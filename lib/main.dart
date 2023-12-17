import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/GlobalScaffold.dart';
import 'package:flutter_application_3/HomePage.dart';
import 'package:flutter_application_3/Currency.dart';
import 'package:flutter_application_3/Distance.dart';
import 'package:flutter_application_3/LoginPage.dart';
import 'package:flutter_application_3/Mass.dart';
import 'package:flutter_application_3/SignupPage.dart';
import 'package:flutter_application_3/Temperature.dart';
import 'package:flutter_application_3/mysplashscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:sqflite_common_ffi/sqflite_ffi.dart' as sqflite_ffi;
// import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  // sqflite_ffi.databaseFactory = databaseFactoryFfi;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MySplashScreen(),
      initialRoute: '/', // Page initial
      routes: {
        '/home': (context) => GlobalScaffold(
              body: HomePage(),
            ),
        '/mass_converter': (context) => GlobalScaffold(
              body: MassConverter(title: 'Masse'),
            ),
        '/distance_converter': (context) => GlobalScaffold(
              body: DistanceConverter(title: 'Distance'),
            ),
        '/currency_converter': (context) => GlobalScaffold(
              body: CurrencyConverter(title: 'Devises'),
            ),
        '/temperature_converter': (context) => GlobalScaffold(
              body: TemperatureConverter(title: 'Température'),
            ),
        '/login': (context) => Scaffold(body: LoginPage()),
        '/signup': (context) => Scaffold(body: SignupPage()),
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
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 243, 235, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitDualRing(
              color: Color.fromARGB(181, 93, 64, 8),
              size: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
