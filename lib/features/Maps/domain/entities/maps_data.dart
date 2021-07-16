class MapsDataEntity {
  final List<String> images;
  final String title;
  final String description;

  MapsDataEntity(
      {required this.images, required this.title, required this.description});

  factory MapsDataEntity.fromJson(Map<String, dynamic> json) {
    return new MapsDataEntity(
        images: json['images'],
        title: json["title"],
        description: json["description"]);
  }
}
