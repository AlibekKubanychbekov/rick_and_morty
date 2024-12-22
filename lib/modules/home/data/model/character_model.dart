import 'package:rick_and_morty/modules/home/domain/entity/character_entity.dart';

class CharacterResponseModel extends CharacterResponseEntity {
  CharacterResponseModel({
    required super.results,
    super.count,
    super.pages,
    super.next,
    super.prev,
  });
  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) {
    return CharacterResponseModel(
      results: (json['results'] as List)
          .map((e) => CharacterModel.fromJson(e))
          .toList(),
      count: json['info']['count'] ?? 0,
      next: json['info']['next'] ?? '',
      prev: json['info']['prev'] ?? '',
      pages: json['info']['pages'] ?? 0,
    );
  }
}

class CharacterModel extends CharacterEntity {
  CharacterModel({
    required super.image,
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.type,
    required super.gender,
  });
  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      image: json['image'],
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
    );
  }
}
