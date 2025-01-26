import 'package:rickandmorty/data/api/characters_api.dart';
import 'package:rickandmorty/data/models/characters_model.dart';

class CharactersRepo {
  final CharactersApi charactersapi;

  CharactersRepo({required this.charactersapi});

  Future<List<Charactersmodel>> getallcharacters() async {
    final characters = await charactersapi.getAllCharacters();
    return characters
        .map((character) => Charactersmodel.fromJson(character))
        .toList();
  }
}
