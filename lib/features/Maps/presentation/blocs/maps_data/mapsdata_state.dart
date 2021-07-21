part of 'mapsdata_bloc.dart';

@immutable
abstract class MapsdataState {}



class Empty extends MapsdataState {}

class Loading extends MapsdataState {}

class Loaded extends MapsdataState {
  final List<MapsDataEntity> mapsDataList;
  Loaded({required this.mapsDataList});
}


class Error extends MapsdataState {
  final String message;

  Error({required this.message});
}
