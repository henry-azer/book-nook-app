import 'package:book_nook_app/core/error/exceptions.dart';

import 'package:book_nook_app/features/profile/domain/entities/user.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_datasource.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final NetworkInfo networkInfo;
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;

  ProfileRepositoryImpl(
      {required this.networkInfo,
      required this.profileLocalDataSource,
      required this.profileRemoteDataSource});

  @override
  Future<Either<GenericException, User>> findCurrentUser() async {
    if (await networkInfo.isConnected) {
      try {
        final currentUser = await profileRemoteDataSource.findCurrentUser();
        profileLocalDataSource.cacheCurrentUser(currentUser);
        return Right(currentUser);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      try {
        final cachedCurrentUser = await profileLocalDataSource.getCurrentUser();
        return Right(cachedCurrentUser);
      } on CacheException {
        return const Left(CacheException());
      }
    }
  }
}
