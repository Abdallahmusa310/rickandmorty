import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/data/models/characters_model.dart';
import 'package:rickandmorty/data/repository/characters_repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo charactersRepo;
  late List<Charactersmodel> chracters;
  CharacterCubit(this.charactersRepo) : super(RickandmortyInitial());

  List<Charactersmodel> getallcharacters() {
    charactersRepo.getallcharacters().then((character) {
      emit(Characterssucsses(character));
      chracters = character;
    });
    return chracters;
  }
}
