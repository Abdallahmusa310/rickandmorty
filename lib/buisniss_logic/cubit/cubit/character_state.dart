part of 'character_cubit.dart';

@immutable
sealed class CharacterState {}

final class RickandmortyInitial extends CharacterState {}

class Characterssucsses extends CharacterState {
  final List<Charactersmodel> characters;
  Characterssucsses(this.characters);
}

class CharactersLoading extends CharacterState {
  final List<Charactersmodel>? characters;
  CharactersLoading([this.characters]);
}

class CharactersError extends CharacterState {
  final String message;
  CharactersError(this.message);
}
