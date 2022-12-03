import 'package:book_nook_app/core/api/app_authentication.dart';
import 'package:book_nook_app/features/signin/data/datasources/signin_local_datasource.dart';
import 'package:book_nook_app/features/signin/data/datasources/signin_remote_datasource.dart';
import 'package:book_nook_app/features/signin/domain/repositories/signin_repository.dart';
import 'package:book_nook_app/features/signin/domain/usecases/signin_usecase.dart';
import 'package:book_nook_app/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/profile/data/datasources/profile_local_datasource.dart';
import 'package:book_nook_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:book_nook_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:book_nook_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:book_nook_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'features/signin/data/repositories/signin_repository_impl.dart';
import 'features/profile/domain/usecases/current_user_usecase.dart';
import 'features/splash/data/datasources/lang_local_data_source.dart';
import 'features/splash/data/repositories/lang_repository_impl.dart';
import 'features/splash/domain/repositories/lang_repository.dart';
import 'features/splash/domain/usecases/change_lang.dart';
import 'features/splash/domain/usecases/get_saved_lang.dart';
import 'features/splash/presentation/cubit/locale_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features

  // Blocs
  sl.registerFactory<SigninCubit>(() => SigninCubit(signinUseCase: sl()));
  sl.registerFactory<ProfileCubit>(() => ProfileCubit(profileUserCase: sl()));

  sl.registerFactory<LocaleCubit>(() => LocaleCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));

  // Use cases
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase(signinRepository: sl()));
  sl.registerLazySingleton<CurrentUserUseCase>(() => CurrentUserUseCase(profileRepository: sl()));

  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(langRepository: sl()));

  // Repository
  sl.registerLazySingleton<SigninRepository>(() => SigninRepositoryImpl(
        networkInfo: sl(),
        signinLocalDataSource: sl(),
        signinRemoteDataSource: sl(),
      ));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
    networkInfo: sl(),
    profileLocalDataSource: sl(),
    profileRemoteDataSource: sl(),
  ));

  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(langLocalDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton<SigninLocalDataSource>(() => SigninLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<SigninRemoteDataSource>(() => SigninRemoteDataSourceImpl(apiConsumer: sl()));
  sl.registerLazySingleton<ProfileLocalDataSource>(() => ProfileLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(apiConsumer: sl()));

  sl.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<AppAuthentication>(() => AppAuthenticationImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppInterceptors(sl()));
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
}
