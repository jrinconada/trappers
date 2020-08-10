
/// Artist info
class Trapper {
  final String name;
  final String genre;
  final String pic;

  Trapper.fromJson(Map<String, dynamic> json) :
    name = json['name'],
    genre = json['genre'],
    pic = json['pic'];
}