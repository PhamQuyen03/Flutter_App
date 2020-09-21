import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/features/authentication/domain/usercases/request_register.dart';
import 'package:flutter_app/features/authentication/presentation/bloc/register/register_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/services/authentication_service.dart';
import 'core/ultis/input_converter.dart';
import 'core/ultis/net_ultis.dart';
import 'features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'features/authentication/data/repositories/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repository.dart';
import 'features/authentication/domain/usercases/request_login.dart';
import 'features/authentication/domain/usercases/request_token.dart';
import 'features/authentication/presentation/bloc/login/login_bloc.dart';
import 'features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'features/number_trivia/presentation/bloc/number_trivia_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features - Number Trivia
  //bloc
  sl.registerFactory(() => NumberTriviaBloc(
        concrete: sl(),
        random: sl(),
        inputConverter: sl(),
      ));
  //user cases
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));
  //Repositories
  sl.registerLazySingleton<NumberTriviaRepository>(() =>
      NumberTriviaRepositoryImpl(
          remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));
  //Data sources
  sl.registerLazySingleton<NumberTriviaRemoteDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<NumberTriviaLocalDataSource>(
      () => NumberTriviaLocalDataSourceImpl(sharedPreferences: sl()));
  //! Features - Authentication
  //bloc
  sl.registerFactory(() => LoginBloc(
        requestLogin: sl(),
      ));
  sl.registerFactory(() => RegisterBloc(
        requestLogin: sl(),
      ));
  //user cases
  sl.registerLazySingleton(() => RequestLogin(sl()));
  sl.registerLazySingleton(() => RequestToken(sl()));
  sl.registerLazySingleton(() => RequestRegister(sl()));
  //Repositories
  sl.registerLazySingleton<AuthenticationRepository>(() =>
      AuthenticationRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));
  //Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
      () => AuthenticationRemoteDataSourceImpl());
  //! Interceptor
  sl.registerFactory<Dio>(() => NetUtils.getDioInstance());
  //! Cores
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => AuthenticationService(requestToken: sl()));
  //!External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
