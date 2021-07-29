
import 'package:get_it/get_it.dart';
import 'package:project_initiative_club_app/features/Maps/data/datasources/maps_local_data_source.dart';
import 'package:project_initiative_club_app/features/Maps/data/datasources/maps_remote_data_source.dart';
import 'package:project_initiative_club_app/features/Maps/data/repositories/maps_repository.dart';
import 'package:project_initiative_club_app/features/Maps/domain/repositories/maps_repository.dart';
import 'package:project_initiative_club_app/features/Maps/domain/usecases/maps_data.dart';
import 'package:project_initiative_club_app/features/Maps/presentation/blocs/maps_data/mapsdata_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //! Lost
  sl.registerFactory(() => MapsdataBloc(mapsDataCase: sl()));

  //* UseCase
  sl.registerLazySingleton(() => MapsDataCase(mapsRepository: sl()));

  //* Repository
  sl.registerLazySingleton<MapsRepository>(() => MapsRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl()));

  //*DataSources
  sl.registerLazySingleton<MapsRemoteDataSource>(
      () => MapsRemoteDataSourceImpl());
      
  sl.registerLazySingleton<MapsLocalDataSource>(
      () => MapsLocalDataSourceImpl());

  
}
