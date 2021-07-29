import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:project_initiative_club_app/features/Maps/data/datasources/maps_local_data_source.dart';
import 'package:project_initiative_club_app/features/Maps/data/datasources/maps_remote_data_source.dart';
import 'package:project_initiative_club_app/features/Maps/data/models/MapsDataModel.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/domain/repositories/maps_repository.dart';
import 'package:project_initiative_club_app/ressources/errors/exceptions.dart';
import 'package:project_initiative_club_app/ressources/errors/failures.dart';
import 'package:project_initiative_club_app/ressources/globals.dart';

class MapsRepositoryImpl implements MapsRepository {
  final MapsRemoteDataSource remoteDataSource;
  final MapsLocalDataSource localDataSource;

  MapsRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<MapsDataEntity>>> getMapsData() async {
    try {
      iconAdminsitration = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)),
          'images/icons/administration_icon.png');

      iconEntry = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)),
          'images/icons/entry_icon.png');

      iconFaculty = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)),
          'images/icons/faculty_icon.png');

      iconFood = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)), 'images/icons/food_icon.png');

      iconOther = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(12, 12)),
          'images/icons/other_icon.png');

      mapStyle = await rootBundle.loadString('json/style_map.json');

      List<MapsDataEntity> list = [];

      Map<String, dynamic> json = await localDataSource.getJsonData();

      List<dynamic> listJson = json['infos'];

      listJson.forEach((element) {
        list.add(MapsDataModel.fromJson(element));
      });
      listMapData = list;
      return Right(list);
    } on ClientException catch (error) {
      return Left(ClientFailure(message: error.message));
    }
  }
}
