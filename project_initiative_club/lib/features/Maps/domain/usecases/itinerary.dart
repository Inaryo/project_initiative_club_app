


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/domain/repositories/maps_repository.dart';
import 'package:project_initiative_club_app/ressources/errors/failures.dart';
import 'package:project_initiative_club_app/ressources/usecases/usecase.dart';

class ItineraryCase implements UseCase<Map<PolylineId, Polyline>, ItineraryCaseParams> {
  final MapsRepository mapsRepository;

  ItineraryCase({required this.mapsRepository});


  @override
  Future<Either<Failure, Map<PolylineId, Polyline> >> call(ItineraryCaseParams params) async {
    return await mapsRepository.getRoutesFromPositions();
  }
}

class ItineraryCaseParams  {

        final List<LatLng> positions;

  ItineraryCaseParams({required this.positions});

}
