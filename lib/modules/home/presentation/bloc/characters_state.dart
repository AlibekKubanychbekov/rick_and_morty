import 'package:rick_and_morty/core/enums/state_status.dart';
import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

class CharactersState {
  final StateStatus status;
  final CharacterResponseEntity? characters;

  CharactersState({required this.status, this.characters});
}
