
import 'package:dartz/dartz.dart';
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/services/trapi.dart';

/// Manages network connections with the API
class MockTrapi implements Trapi {

  List<Trapper> prepareTrappers () {
    List<Trapper> trappers = new List();
    var info = {    
      "name": "Rosalia",
      "genre": "Trap flamenco",
      "pic": "https://i.avoz.es/sc/rMsptQU3g42HxOaAATfHlHatfdU=/x/2018/11/07/00121541584284025196450/Foto/rosalia.jpg"    
    };
    trappers.add(Trapper.fromJson(info));
    return trappers;
  }

  @override
  Future<Either<Failure, List<Trapper>>> getTrappers() async {
    await Future.delayed(const Duration(seconds: 3)); // Take some time
    return Right(prepareTrappers()); // Ok
    return Left(Failure('Network error')); // Error
  }
}
