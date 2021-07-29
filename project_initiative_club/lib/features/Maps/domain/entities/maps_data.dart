import "package:google_maps_flutter/google_maps_flutter.dart";

class MapsDataEntity {

  final List<String> images;
  final String title;
  final String description;
  final LatLng position;
  

  MapsDataEntity({required this.position,required this.images, required this.title, required this.description});

  
}
