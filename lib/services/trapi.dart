import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:trappers/models/trapper.dart';

/// Manages network connections with the API
class Trapi {
  static final String baseURL = 'https://private-ff2081-trapi1.apiary-mock.com/';
  static final String getTrappersEndpoint = baseURL + 'trappers';

  /// Requests a list of trappers to the server
  Future<List<Trapper>> getTrappers() async {
    var response = await http.get(getTrappersEndpoint); // Call API
    var json = convert.jsonDecode(response.body) as List; // Get JSON body
    var trappers = json.map((jsonItem) => Trapper.fromJson(jsonItem)).toList(); // Parse JSON
    return trappers;
  }
}