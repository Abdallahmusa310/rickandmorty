class Charactersmodel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List<String> episode;
  late Map<String, dynamic> origin;

  Charactersmodel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    gender = json["gender"];
    image = json["image"];
    episode = List<String>.from(json["episode"]);
    origin = json["origin"];
  }
}
