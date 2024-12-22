import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_state.dart';
import 'package:rick_and_morty/modules/home/usecases/fetch_all_characters_usecase.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  CharactersBloc({
    required FetchAllCharactersUsecase fetchAllCharactersUsecase,
  })  : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
        super(CharactersState(status: StateStatus.init)) {
    on<FetchCharactersEvent>(
      (event, emit) async {
        emit(CharactersState(status: StateStatus.loading));
        try {
          final result = await _fetchAllCharactersUsecase
              .execute(FetchAllCharactersParams());
          emit(
              CharactersState(status: StateStatus.success, characters: result));
        } catch (e) {
          emit(CharactersState(status: StateStatus.error));
        }
      },
    );
  }
}
