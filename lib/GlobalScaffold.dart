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
        backgroundColor: Color.fromRGBO(255, 243, 235, 1),
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
          child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(255, 243, 235, 1)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(181, 93, 64, 1),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                    color: Color.fromRGBO(255, 243, 235, 1),
                    fontSize: 42,
                    fontWeight: FontWeight.w800),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: TextStyle(
                    color: Color.fromRGBO(73, 57, 52, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text(
                'Distance',
                style: TextStyle(
                    color: Color.fromRGBO(73, 57, 52, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/distance_converter');
              },
            ),
            ListTile(
              title: Text(
                'Masse',
                style: TextStyle(
                    color: Color.fromRGBO(73, 57, 52, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/mass_converter');
              },
            ),
            ListTile(
              title: Text(
                'Température',
                style: TextStyle(
                    color: Color.fromRGBO(73, 57, 52, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/temperature_converter');
              },
            ),
            ListTile(
              title: Text(
                'Devises',
                style: TextStyle(
                    color: Color.fromRGBO(73, 57, 52, 1),
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/currency_converter');
              },
            ),
          ],
        ),
      )),
      body: body,
    );
  }
}
