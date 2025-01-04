import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rickandmorty_state.dart';

class RickandmortyCubit extends Cubit<RickandmortyState> {
  RickandmortyCubit() : super(RickandmortyInitial());
}
