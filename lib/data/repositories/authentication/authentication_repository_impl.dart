import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/datasources/authentication/authentication_local_datasource.dart';
import 'package:book_nook_app/data/repositories/authentication/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/network/network_info.dart';
import '../../../core/utils/app_strings.dart';
import '../../entities/authentication/signin.dart';
import '../../datasources/authentication/authentication_remote_datasource.dart';
import '../../entities/authentication/signin_claims.dart';
import '../../entities/user/user.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationLocalDataSource authenticationLocalDataSource;
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;

  AuthenticationRepositoryImpl(
      {required this.networkInfo,
      required this.authenticationLocalDataSource,
      required this.authenticationRemoteDataSource});

  @override
  Future<Either<GenericException, ResponseModel<User>>> getCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        final responseCurrentUser = await authenticationRemoteDataSource.findCurrentUser();
        authenticationLocalDataSource.cacheCurrentUser(responseCurrentUser.model);
        return Right(responseCurrentUser);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      try {
        final cachedCurrentUser = await authenticationLocalDataSource.getCurrentUser();
        return Right(ResponseModel(
            success: true, message: AppStrings.cachedUserFetchSuccess, model: cachedCurrentUser));
      } on CacheException {
        return const Left(CacheException());
      }
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<SigninClaims>>> signin(Signin signin) async {
    if (await networkInfo.isConnected) {
      try {
        authenticationLocalDataSource.cacheIsUserLogging();
        final responseSigninClaims = await authenticationRemoteDataSource.signin(signin);
        authenticationLocalDataSource.cacheSigninClaims(signin, responseSigninClaims.model);
        return Right(responseSigninClaims);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> signout() {
    // TODO: implement signout
    throw UnimplementedError();
  }
}
