import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/core/service/dio_settings.dart';
import 'package:rick_and_morty/modules/home/data/api/home_api.dart';
import 'package:rick_and_morty/modules/home/data/repository/home_repository.dart';
import 'package:rick_and_morty/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty/modules/home/usecases/fetch_all_characters_usecase.dart';

class CharactersDi {
  final GetIt di;

  CharactersDi({required this.di});
  inject() {
    di.registerSingleton<HomeApi>(
      HomeApi(
        DioSetting().dio,
      ),
    );
    di.registerFactory(() {
      return FetchAllCharactersUsecase(
        repository: HomeRepository(
          homeApi: di(),
        ),
      );
    });
    di.registerFactory(
      () => CharactersBloc(
        fetchAllCharactersUsecase: di(),
      ),
    );
  }
}
