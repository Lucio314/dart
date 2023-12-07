import 'package:flutter/material.dart';
import 'dart:math';

class DistanceConverter extends StatefulWidget {
  DistanceConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DistanceConverter> createState() => _DistanceConverterState();
}

class _DistanceConverterState extends State<DistanceConverter> {
  double valeur = 0;
  double _convertedValue = 0;
  String uniteDepart = 'km';
  String uniteDestination = 'm';

  final List<String> unitesDeMesure = [
    'km',
    'hm',
    'dam',
    'm',
    'dm',
    'cm',
    'mm'
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

  void _convertDistance() {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Image au-dessus des autres éléments
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 5),
            child: Image.asset(
              'assets/Distance.png',
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
                      onPressed: _convertDistance,
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
