import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/modules/home/presentation/di/characters_di.dart';

void setup(GetIt di) {
  CharactersDi(di: di).inject();
}
