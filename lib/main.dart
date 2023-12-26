import 'package:flutter/material.dart';
import 'package:flutter_application_3/Currency.dart';
import 'package:flutter_application_3/Distance.dart';
import 'package:flutter_application_3/GlobalScaffold.dart';
import 'package:flutter_application_3/HomePage.dart';
import 'package:flutter_application_3/Mass.dart';
import 'package:flutter_application_3/Temperature.dart';
import 'package:flutter_application_3/mysplashscreen.dart';
import 'package:flutter_application_3/signup_screen.dart';
import 'package:flutter_application_3/signin_screen.dart';

void main() {
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
      initialRoute: '/',
      routes: {
        '/home': (context) => HomePage(),
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
        '/login': (context) => Scaffold(body: SignInScreen()),
        '/signup': (context) => Scaffold(body: SignUpScreen()),
      },
    );
  }
}
