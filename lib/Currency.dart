import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double valeur = 0;
  double _convertedValue = 0;
  String uniteDepart = 'fcfa';
  String uniteDestination = 'eur';

  final List<String> currencies = ['fcfa', 'eur', 'usd', 'gbp'];

  void _converterCurrency() {
    setState(() {
      _convertedValue = convertCurrency(
        valeur: valeur,
        uniteDepart: uniteDepart,
        uniteDestination: uniteDestination,
      );
    });
  }

  double convertCurrency(
      {required double valeur,
      required String uniteDepart,
      required String uniteDestination}) {
    double convertedPrice = 0.0;
    switch (uniteDepart.toUpperCase()) {
      case 'FCFA':
        convertedPrice = convertFromFcfa(valeur, uniteDestination);
        break;
      case 'USD':
        convertedPrice = convertFromDollard(valeur, uniteDestination);
        break;
      case 'EUR':
        convertedPrice = convertFromEuro(valeur, uniteDestination);
        break;
      case 'GBP':
        convertedPrice = convertFromLivre(valeur, uniteDestination);
        break;
      default:
        print('Devise de départ non reconnue');
    }
    return convertedPrice;
  }

  double convertFromFcfa(double price, String currencyTo) {
    final Map<String, double> rates = {
      'usd': 0.001524,
      'eur': 0.001673,
      'gbp': 0.001318,
    };

    if (rates.containsKey(currencyTo.toLowerCase())) {
      return price * rates[currencyTo.toLowerCase()]!;
    } else {
      print('Devise de destination non reconnue');
      return 0.0;
    }
  }

  double convertFromDollard(double price, String currencyTo) {
    final Map<String, double> rates = {
      'fcfa': 597.7516,
      'eur': 0.9113,
      'gbp': 0.7877,
    };

    if (rates.containsKey(currencyTo.toLowerCase())) {
      return price * rates[currencyTo.toLowerCase()]!;
    } else {
      print('Devise de destination non reconnue');
      return 0.0;
    }
  }

  double convertFromEuro(double price, String currencyTo) {
    final Map<String, double> rates = {
      'fcfa': 655.957,
      'usd': 1.0974,
      'gbp': 0.8644,
    };

    if (rates.containsKey(currencyTo.toLowerCase())) {
      return price * rates[currencyTo.toLowerCase()]!;
    } else {
      print('Devise de destination non reconnue');
      return 0.0;
    }
  }

  double convertFromLivre(double price, String currencyTo) {
    final Map<String, double> rates = {
      'fcfa': 758.8408,
      'usd': 1.2695,
      'eur': 1.1569,
    };

    if (rates.containsKey(currencyTo.toLowerCase())) {
      return price * rates[currencyTo.toLowerCase()]!;
    } else {
      print('Devise de destination non reconnue');
      return 0.0;
    }
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
              'assets/devises.png', // Chemin de votre image de devises
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
                      items: currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
                        );
                      }).toList(),
                    ),
                    ElevatedButton(
                      onPressed: _converterCurrency,
                      child: const Icon(Icons.compare_arrows),
                    ),
                    DropdownButton<String>(
                      value: uniteDestination,
                      onChanged: (String? newValue) {
                        setState(() {
                          uniteDestination = newValue!;
                        });
                      },
                      items: currencies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
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
