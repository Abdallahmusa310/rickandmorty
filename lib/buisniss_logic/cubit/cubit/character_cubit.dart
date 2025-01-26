import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rickandmorty/data/models/characters_model.dart';
import 'package:rickandmorty/data/repository/characters_repo.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepo charactersRepo;
  List<Charactersmodel> chracters = [];
  CharacterCubit(this.charactersRepo) : super(RickandmortyInitial());

  void getallcharacters() async {
    emit(CharactersLoading());
    try {
      final characters = await charactersRepo.getallcharacters();
      chracters = characters;
      emit(Characterssucsses(characters));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }
}
