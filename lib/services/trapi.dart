
import 'package:dartz/dartz.dart';
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';

abstract class Trapi {
  /// Requests a list of trappers to the server
  Future<Either<Failure, List<Trapper>>> getTrappers();
}