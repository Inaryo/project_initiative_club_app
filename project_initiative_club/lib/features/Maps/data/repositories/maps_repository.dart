
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
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
      {required this.remoteDataSource,
      required this.localDataSource});

  

  @override
  Future<Either<Failure, List<MapsDataEntity>>> getMapsData() async {
    
        try {
          List<MapsDataEntity> list = [];

          
          Map<String,dynamic> json = await localDataSource.getJsonData();
          
          
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


  Future<Either<Failure, Map<PolylineId, Polyline> >> getRoutesFromPositions() async {
    
        try {
          List<MapsDataEntity> list = [];

          
          Map<String,dynamic> json = await localDataSource.getJsonData();
          
          
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
