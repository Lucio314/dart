import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';

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
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Color.fromRGBO(250, 223, 206, 1),
        ),
        body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(255, 243, 235, 1)),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 5),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 25),
                    child: Expanded(
                      child: SvgPicture.asset(
                        'assets/svg/temp.svg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  )),
              // Reste des éléments en dessous de l'image
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Enter Value',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 18),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
