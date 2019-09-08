import 'dart:convert';
import 'package:http/http.dart' as Http;

class Webservice {
  static Future<T> get<T>(String uri) async {
      final response = await Http.get(uri);

      if(response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data!');
      }
  }
}