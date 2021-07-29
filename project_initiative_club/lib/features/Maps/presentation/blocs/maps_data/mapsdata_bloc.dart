import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_initiative_club_app/features/Maps/domain/entities/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/domain/usecases/maps_data.dart';

part 'mapsdata_event.dart';
part 'mapsdata_state.dart';

class MapsdataBloc extends Bloc <MapsdataEvent, MapsdataState> {

  final MapsDataCase mapsDataCase;

  MapsdataBloc({required this.mapsDataCase}) : super(Empty());

  @override
  Stream<MapsdataState> mapEventToState(MapsdataEvent event) async* {

    if (event is GetMapsDataEvent) {

      yield Loading();
      final failureOrBool = await mapsDataCase.call(NoParams());
      print(failureOrBool);
      yield failureOrBool.fold(
        (error) => Error(message: error.message),
        (list) => Loaded(mapsDataList: list),
      );

    }

    
    // TODO: implement mapEventToState
  }
}
