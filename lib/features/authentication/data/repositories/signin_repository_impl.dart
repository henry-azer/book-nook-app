import 'package:book_nook_app/features/authentication/data/datasources/signin_local_datasource.dart';
import 'package:book_nook_app/features/authentication/domain/repositories/signin_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/signin_claims.dart';
import '../../domain/entities/signin.dart';
import '../datasources/signin_remote_datasource.dart';

class SigninRepositoryImpl implements SigninRepository {
  final NetworkInfo networkInfo;
  final SigninRemoteDataSource signinRemoteDataSource;
  final SigninLocalDataSource signinLocalDataSource;

  SigninRepositoryImpl(
      {required this.networkInfo,
      required this.signinLocalDataSource,
      required this.signinRemoteDataSource});

  @override
  Future<Either<GenericException, SigninClaims>> signin(Signin signin) async {
    if (await networkInfo.isConnected) {
      try {
        final signinClaims = await signinRemoteDataSource.signin(signin);
        if (signin.rememberme) {
          signinLocalDataSource.cacheSigninClaims(signin, signinClaims);
        }
        return Right(signinClaims);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }


}
