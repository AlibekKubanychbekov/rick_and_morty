class CharacterResponseEntity {
  final List<CharacterEntity> results;
  final int count;
  final int pages;
  String next;
  String prev;

  CharacterResponseEntity({
    required this.results,
    this.count = 0,
    this.pages = 0,
    this.next = '',
    this.prev = '',
  });
}

class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final String image;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.image,
  });

  CharacterEntity.empty()
      : id = 0,
        name = '',
        status = '',
        species = '',
        type = '',
        gender = '',
        image = '';
}
