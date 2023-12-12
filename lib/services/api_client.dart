// ignore_for_file: unused_import

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL =
      Uri.https("free.currconv.com", "/api/v7/currencies", {});
}
