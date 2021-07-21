


import 'package:dartz/dartz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';

class MapsDataModel extends MapsDataEntity {
  
  final String title;
  final String description;
  final List<String> images;
  final LatLng position;

  MapsDataModel({required this.position,required this.title, required this.description, required this.images}) : super(
    title: title,
    description: description,
    images: images,
    position: position
  );

  /// 
  ///  Return MapsDataModel from json or null !
  ///
  factory MapsDataModel.fromJson(dynamic json) {

        LatLng _position = new LatLng( json["position"]["latitude"], json["position"]["longitude"]);
        return MapsDataModel(position: _position,description: json["description"],images: [],title: json["title"]);
      
  }
}