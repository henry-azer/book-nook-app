import 'package:book_nook_app/core/api/app_authentication.dart';
import 'package:book_nook_app/data/datasources/authentication/authentication_local_datasource.dart';
import 'package:book_nook_app/data/datasources/authentication/authentication_remote_datasource.dart';
import 'package:book_nook_app/data/datasources/book/book_local_datasource.dart';
import 'package:book_nook_app/data/datasources/book/book_remote_datasource.dart';
import 'package:book_nook_app/data/datasources/user/user_local_datasource.dart';
import 'package:book_nook_app/data/datasources/user/user_remote_datasource.dart';
import 'package:book_nook_app/data/repositories/book/book_repository.dart';
import 'package:book_nook_app/data/repositories/book/book_repository_impl.dart';
import 'package:book_nook_app/data/repositories/user/user_repository.dart';
import 'package:book_nook_app/data/repositories/user/user_repository_impl.dart';
import 'package:book_nook_app/features/splash/domain/usecases/app_welcomed_user_usecase.dart';
import 'package:book_nook_app/features/splash/presentation/cubit/app_welcome_cubit.dart';
import 'package:book_nook_app/features/user-profile/domain/usecases/signout_usecase.dart';
import 'package:book_nook_app/features/user-profile/presentation/cubit/signout_cubit.dart';
import 'package:book_nook_app/features/signin/domain/usecases/signin_usecase.dart';
import 'package:book_nook_app/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/user-profile/presentation/cubit/user_profile_cubit.dart';
import 'package:book_nook_app/features/signup/Presentation/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/api/api_consumer.dart';
import 'core/api/app_interceptors.dart';
import 'core/api/dio_consumer.dart';
import 'core/network/network_info.dart';
import 'data/repositories/authentication/authentication_repository.dart';
import 'data/repositories/authentication/authentication_repository_impl.dart';
import 'features/user-profile/domain/usecases/current_user_usecase.dart';
import 'data/datasources/localization/localization_local_data_source.dart';
import 'data/repositories/localization/localization_repository_impl.dart';
import 'data/repositories/localization/localization_repository.dart';
import 'features/signup/domain/usecases/signup_usecase.dart';
import 'features/splash/domain/usecases/change_lang_usecase.dart';
import 'features/splash/domain/usecases/get_saved_lang_usecase.dart';
import 'features/splash/presentation/cubit/localization_cubit.dart';
import 'features/user-recommended-books/domain/usecases/recommended_books_usecase.dart';
import 'features/user-recommended-books/presentation/cubit/recommended_books_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // !---- Cubits ----!
  // signin
  sl.registerFactory<SigninCubit>(() => SigninCubit(signinUseCase: sl()));
  // signup
  sl.registerFactory<SignupCubit>(() => SignupCubit(signupUseCase: sl()));
  // profile
  sl.registerFactory<UserProfileCubit>(() => UserProfileCubit(profileUserCase: sl()));
  sl.registerFactory<SignoutCubit>(() => SignoutCubit(signoutUseCase: sl()));
  // splash
  sl.registerFactory<AppWelcomeCubit>(() => AppWelcomeCubit(appWelcomedUserUserCase: sl()));
  sl.registerFactory<LocalizationCubit>(() => LocalizationCubit(getSavedLangUseCase: sl(), changeLangUseCase: sl()));
  // home
  sl.registerFactory<RecommendedBooksCubit>(() => RecommendedBooksCubit(recommendedBooksUseCase: sl()));

  // !---- Use cases ----!
  // signin
  sl.registerLazySingleton<SigninUseCase>(() => SigninUseCase(authenticationRepository: sl()));
  // signup
  sl.registerLazySingleton<SignupUseCase>(() => SignupUseCase(userRepository: sl()));
  // profile
  sl.registerLazySingleton<CurrentUserUseCase>(() => CurrentUserUseCase(authenticationRepository: sl()));
  sl.registerLazySingleton<SignoutUseCase>(() => SignoutUseCase(authenticationRepository: sl()));
  // splash
  sl.registerLazySingleton<AppWelcomedUserUseCase>(() => AppWelcomedUserUseCase(userRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<GetSavedLangUseCase>(() => GetSavedLangUseCase(langRepository: sl()));
  // home
  sl.registerLazySingleton<RecommendedBooksUseCase>(() => RecommendedBooksUseCase(bookRepository: sl()));


  // !---- Repository ----!
  // authentication
  sl.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(
        networkInfo: sl(),
        authenticationLocalDataSource: sl(),
        authenticationRemoteDataSource: sl(),
      ));
  // user
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        networkInfo: sl(),
        userLocalDataSource: sl(),
        userRemoteDataSource: sl(),
      ));
  // book
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(
    networkInfo: sl(),
    bookLocalDataSource: sl(),
    bookRemoteDataSource: sl(),
  ));
  // localization
  sl.registerLazySingleton<LocalizationRepository>(() => LocalizationRepositoryImpl(localizationLocalDataSource: sl()));


  // !---- Data Sources ----!
  // authentication
  sl.registerLazySingleton<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(apiConsumer: sl()));
  // user
  sl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(apiConsumer: sl()));
  // book
  sl.registerLazySingleton<BookLocalDataSource>(() => BookLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<BookRemoteDataSource>(() => BookRemoteDataSourceImpl(apiConsumer: sl()));
  // localization
  sl.registerLazySingleton<LocalizationLocalDataSource>(() => LocalizationLocalDataSourceImpl(sharedPreferences: sl()));


  // !---- Core ----!
  sl.registerLazySingleton<AppAuthentication>(() => AppAuthenticationImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));


  // !---- External ----!
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
