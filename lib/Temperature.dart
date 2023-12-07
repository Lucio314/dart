import 'package:flutter/material.dart';

class TemperatureConverter extends StatefulWidget {
  TemperatureConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  double temperature = 0;
  double _convertedValue = 0;
  String uniteDepart = 'K';
  String uniteDestination = 'C';

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
              'assets/temperature.png', // Chemin de votre image de température
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
                      temperature = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                const SizedBox(height: 15),
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
                      items: const [
                        'C',
                        'F',
                        'K',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: _conversionTemperature,
                      child: const Icon(Icons.compare_arrows),
                    ),
                    DropdownButton<String>(
                      value: uniteDestination,
                      onChanged: (String? newValue) {
                        setState(() {
                          uniteDestination = newValue!;
                        });
                      },
                      items: const [
                        'C',
                        'F',
                        'K',
                      ].map<DropdownMenuItem<String>>((String value) {
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

  void _conversionTemperature() {
    setState(() {
      _convertedValue = conversionTemperature(
        temperature,
        uniteDepart,
        uniteDestination,
      );
    });
  }

  double conversionTemperature(
      double temperature, String uniteDepart, String uniteDestination) {
    if (uniteDepart == uniteDestination) {
      return temperature;
    }

    switch (uniteDepart) {
      case 'C':
        return conversionCelsius(temperature, uniteDestination);
      case 'F':
        return conversionFahrenheit(temperature, uniteDestination);
      case 'K':
        return conversionKelvin(temperature, uniteDestination);
      default:
        print("Unité de conversion non valide.");
        return 0;
    }
  }

  double conversionCelsius(double celsius, String uniteDestination) {
    switch (uniteDestination) {
      case 'F':
        return (celsius * 9 / 5) + 32;
      case 'K':
        return celsius + 273.15;
      default:
        print("Unité de conversion non valide.");
        return 0;
    }
  }

  double conversionFahrenheit(double fahrenheit, String uniteDestination) {
    switch (uniteDestination) {
      case 'C':
        return (fahrenheit - 32) * 5 / 9;
      case 'K':
        return (fahrenheit - 32) * 5 / 9 + 273.15;
      default:
        print("Unité de conversion non valide.");
        return 0;
    }
  }

  double conversionKelvin(double kelvin, String uniteDestination) {
    switch (uniteDestination) {
      case 'C':
        return kelvin - 273.15;
      case 'F':
        return (kelvin - 273.15) * 9 / 5 + 32;
      default:
        print("Unité de conversion non valide.");
        return 0;
    }
  }
}
