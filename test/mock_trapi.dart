import 'package:dartz/dartz.dart';
import 'package:trappers/models/failure.dart';
import 'package:trappers/models/trapper.dart';
import 'package:trappers/services/trapi.dart';

/// Manages network connections with the API
class MockTrapi implements Trapi {
  bool error = false;
  bool delay = false;

  List<Trapper> prepareTrappers() {
    List<Trapper> trappers = new List();
    var info = {
      "name": "Rosalia",
      "genre": "Trap flamenco",
      "pic":
          "https://i.avoz.es/sc/rMsptQU3g42HxOaAATfHlHatfdU=/x/2018/11/07/00121541584284025196450/Foto/rosalia.jpg"
    };
    trappers.add(Trapper.fromJson(info));
    info = {
        "name": "Post Malone",
        "genre": "Pop Trap",
        "pic": "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2018/07/11/15313304669358.jpg"
    };
    trappers.add(Trapper.fromJson(info));
    info = {
        "name": "Kinder Malo",
        "genre": "Trap irónico",
        "pic": "https://i.ytimg.com/vi/j8SbnkUhgnc/maxresdefault.jpg"
    };
    trappers.add(Trapper.fromJson(info));
    return trappers;
  }

  @override
  Future<Either<Failure, List<Trapper>>> getTrappers() async {
    if (delay) await Future.delayed(const Duration(seconds: 3)); // Take some time
    if (!error)
      return Right(prepareTrappers()); // Ok
    else
      return Left(Failure('Network error')); // Error
  }
}
