import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

class NumberService {
  getBilanganGanjil(maxNumber) async {
    var response = await http.get(Uri.parse(
        'http://localhost:3000/number/bilangan-ganjil?maxNumber=$maxNumber'));
    return json.decode(response.body);
  }

  getBilanganPrima(maxNumber) async {
    var response = await http.get(Uri.parse(
        'http://localhost:3000/number/bilangan-prima?maxNumber=$maxNumber'));
    return json.decode(response.body);
  }

  getSegitiga(String input) async {
    var response = await http
        .get(Uri.parse('http://localhost:3000/number/segitiga?number=$input'));
    return json.decode(response.body);
  }
}
