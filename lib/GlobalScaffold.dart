// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget body;

  const GlobalScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(''),
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
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Distance'),
              onTap: () {
                Navigator.pushNamed(context, '/distance_converter');
              },
            ),
            ListTile(
              title: Text('Masse'),
              onTap: () {
                Navigator.pushNamed(context, '/mass_converter');
              },
            ),
            ListTile(
              title: Text('Température'),
              onTap: () {
                Navigator.pushNamed(context, '/temperature_converter');
              },
            ),
            ListTile(
              title: Text('Devises'),
              onTap: () {
                Navigator.pushNamed(context, '/currency_converter');
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            ListTile(
              title: Text('Signup'),
              onTap: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
