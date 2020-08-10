import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/services/trapi.dart';

/// Manages network connections with the API
class HttpTrapi implements Trapi {
  static const String _baseURL =
      'https://private-ff2081-trapi1.apiary-mock.com';

  @override
  Future<Either<Failure, List<Trapper>>> getTrappers() async {
    try {
      var response = await http.get('$_baseURL/trappers'); // Call API
      // Check response code
      if (response.statusCode == 200) {
        var json = convert.jsonDecode(response.body) as List; // Get JSON body
        var trappers = json
            .map((jsonItem) => Trapper.fromJson(jsonItem))
            .toList(); // Parse JSON
        return Right(trappers);
      } else {
        // Return the error
        return Left(Failure(response.body));
      }
    } catch (e) {
      // Connection error
      print(e.toString());
      return Left(Failure('Connection problem'));
    }
  }
}
