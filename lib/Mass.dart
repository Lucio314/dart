// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

class MassConverter extends StatefulWidget {
  MassConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MassConverter> createState() => _MassConverterState();
}

class _MassConverterState extends State<MassConverter> {
  double valeur = 0;
  double _convertedValue = 0;
  String uniteDepart = 'kg';
  String uniteDestination = 'g';

  final List<String> unitesDeMesure = [
    'kg',
    'hg',
    'dag',
    'g',
    'dg',
    'cg',
    'mg'
  ];

  double conversion({
    required double valeur,
    required String uniteDepart,
    required String uniteDestination,
  }) {
    if (uniteDepart == uniteDestination) {
      return valeur;
    } else {
      return valeur *
          pow(
            10,
            (unitesDeMesure.indexOf(uniteDestination) -
                unitesDeMesure.indexOf(uniteDepart)),
          );
    }
  }

  void _convertMass() {
    setState(() {
      _convertedValue = conversion(
        valeur: valeur,
        uniteDepart: uniteDepart,
        uniteDestination: uniteDestination,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          // Image au-dessus des autres éléments
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 5),
            child: Image.asset(
              'assets/masse.png',
              width: 350,
              height: 350,
            ),
          ),
          // Reste des éléments en dessous de l'image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter Value',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      valeur = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton<String>(
                      value: uniteDepart,
                      onChanged: (String? newValue) {
                        setState(() {
                          uniteDepart = newValue!;
                        });
                      },
                      items: unitesDeMesure
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: _convertMass,
                      child: const Icon(Icons.compare_arrows),
                    ),
                    DropdownButton<String>(
                      value: uniteDestination,
                      onChanged: (String? newValue) {
                        setState(() {
                          uniteDestination = newValue!;
                        });
                      },
                      items: unitesDeMesure
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Converted Value: $_convertedValue $uniteDestination',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
