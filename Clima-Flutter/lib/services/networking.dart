import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper({this.url});

  Future<dynamic> getData() async {
    http.Response response = await http.get(this.url);

    if (response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}
