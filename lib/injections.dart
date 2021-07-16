
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  
  //! Shared
  sl.registerLazySingleton<NetworkInfo>(
      () => NetWorkInfoImpl(dataConnectionChecker: sl()));

  //! Lost
  sl.registerFactory(() => InitlostpageBloc(initLostPageUseCase: sl()));
  sl.registerFactory(() => GetlostanimalsBloc());

  //* UseCase
  sl.registerLazySingleton(() => InitLostPageUseCase(lostRepository: sl()));

  //* Repository
  sl.registerLazySingleton<LostRepository>(() => LostRepositoryImpl(
      localDataSource: sl(), remoteDataSource: sl(), netWorkInfo: sl()));

  //*DataSources
  sl.registerLazySingleton<LostRemoteDataSource>(
      () => LostRemoteDataSourceImpl(geo: sl()));
  sl.registerLazySingleton<LostLocalDataSource>(
      () => LostLocalDataSourceImpl());

  //* Externals
  sl.registerLazySingleton(() => Geoflutterfire());

  //! Authentication
  sl.registerFactory(() => IsloggedinBloc(isLoggedInCase: sl()));
  sl.registerFactory(() => LogginginBloc(loggingInCase: sl()));
  sl.registerFactory(() => RegisterBloc(registerCase: sl()));

  //* UseCase
  sl.registerLazySingleton(() => RegisterCase(authRepository: sl()));
  sl.registerLazySingleton(() => IsLoggedInCase(authRepository: sl()));
  sl.registerLazySingleton(() => LoggingInCase(authRepository: sl()));

  //* Repository
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(
          localDataSource: sl(), remoteDataSource: sl(), netWorkInfo: sl()));

  //*DataSources
  sl.registerLazySingleton<AuthenticationLocalDataSource>(
      () => AuthenticationLocalDataSourceImpl());

  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl(fireBaseAuth: sl()));

  //* Externals
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => DataConnectionChecker());
}
