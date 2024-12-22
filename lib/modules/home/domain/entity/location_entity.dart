class LocationResponseEntity {
  final List<LocationEntity> results;
  final int? count;
  final int? pages;

  LocationResponseEntity({
    required this.results,
    required this.count,
    required this.pages,
  });
}

class LocationEntity {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final String created;

  LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return LocationEntity(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      dimension: json['dimension'],
      residents: List<String>.from(json['residents']),
      url: json['url'],
      created: json['created'],
    );
  }
}
