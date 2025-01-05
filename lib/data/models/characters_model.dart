class Charactersmodel {
  late int id;
  late String name;
  late String status;
  late String species;
  late String gender;
  late String image;
  late List<dynamic> episodes;
  late List<dynamic> origin;

  Charactersmodel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    status = json["status"];
    species = json["species"];
    gender = json["gender"];
    image = json["image"];
    episodes = json["episode"];
    origin = json["origin"];
  }
}
