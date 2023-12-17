import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  CurrencyConverter({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double valeur = 0;
  double _convertedValue = 0;
  String uniteDepart = 'EUR'; // Monnaie de départ par défaut
  String uniteDestination = 'XOF'; // Monnaie de destination par défaut

  final List<String> currencies = [
    'AED',
    'AFN',
    'ALL',
    'AMD',
    'ANG',
    'AOA',
    'ARS',
    'AUD',
    'AWG',
    'AZN',
    'BAM',
    'BBD',
    'BDT',
    'BGN',
    'BHD',
    'BIF',
    'BMD',
    'BND',
    'BOB',
    'BRL',
    'BSD',
    'BTN',
    'BWP',
    'BYN',
    'BZD',
    'CAD',
    'CDF',
    'CHF',
    'CLP',
    'CNY',
    'COP',
    'CRC',
    'CUP',
    'CVE',
    'CZK',
    'DJF',
    'DKK',
    'DOP',
    'DZD',
    'EGP',
    'ERN',
    'ETB',
    'EUR',
    'FJD',
    'FKP',
    'FOK',
    'GBP',
    'GEL',
    'GGP',
    'GHS',
    'GIP',
    'GMD',
    'GNF',
    'GTQ',
    'GYD',
    'HKD',
    'HNL',
    'HRK',
    'HTG',
    'HUF',
    'IDR',
    'ILS',
    'IMP',
    'INR',
    'IQD',
    'IRR',
    'ISK',
    'JEP',
    'JMD',
    'JOD',
    'JPY',
    'KES',
    'KGS',
    'KHR',
    'KID',
    'KMF',
    'KRW',
    'KWD',
    'KYD',
    'KZT',
    'LAK',
    'LBP',
    'LKR',
    'LRD',
    'LSL',
    'LYD',
    'MAD',
    'MDL',
    'MGA',
    'MKD',
    'MMK',
    'MNT',
    'MOP',
    'MRU',
    'MUR',
    'MVR',
    'MWK',
    'MXN',
    'MYR',
    'MZN',
    'NAD',
    'NGN',
    'NIO',
    'NOK',
    'NPR',
    'NZD',
    'OMR',
    'PAB',
    'PEN',
    'PGK',
    'PHP',
    'PKR',
    'PLN',
    'PYG',
    'QAR',
    'RON',
    'RSD',
    'RUB',
    'RWF',
    'SAR',
    'SBD',
    'SCR',
    'SDG',
    'SEK',
    'SGD',
    'SHP',
    'SLL',
    'SOS',
    'SRD',
    'SSP',
    'STN',
    'SYP',
    'SZL',
    'THB',
    'TJS',
    'TMT',
    'TND',
    'TOP',
    'TRY',
    'TTD',
    'TVD',
    'TWD',
    'TZS',
    'UAH',
    'UGX',
    'UYU',
    'UZS',
    'VES',
    'VND',
    'VUV',
    'WST',
    'XAF',
    'XCD',
    'XDR',
    'XOF',
    'XPF',
    'YER',
    'ZAR',
    'ZMW',
    'ZWL'
  ];

  Future<void> _converterCurrency() async {
    try {
      double convertedPrice = await convertCurrency();
      setState(() {
        _convertedValue = convertedPrice;
      });
    } catch (e) {
      print('Erreur lors de la conversion : $e');
      setState(() {
        _convertedValue = 0;
      });
    }
  }

  Future<double> convertCurrency() async {
    final String apiKey = '5d6d9cf413c032dcded2d037';
    final String apiUrl =
        'https://v6.exchangeratesapi.io/latest?base=$uniteDepart&access_key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, dynamic> rates = data['rates'];

      if (rates.containsKey(uniteDestination)) {
        double exchangeRate = rates[uniteDestination];
        return valeur * exchangeRate;
      } else {
        throw Exception('Devise de destination non reconnue');
      }
    } else {
      throw Exception('Failed to load exchange rates');
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 85.0, vertical: 5),
            child: Image.asset(
              'assets/devises.png',
              width: 350,
              height: 350,
            ),
          ),
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
