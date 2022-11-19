import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/lang_repository.dart';
import '../datasources/lang_local_data_source.dart';

class LangRepositoryImpl implements LangRepository {
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});

  @override
  Future<Either<GenericException, bool>> changeLang(
      {required String langCode}) async {
    try {
      final langIsChanged =
          await langLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } on CacheException {
      return const Left(CacheException());
    }
  }

  @override
  Future<Either<GenericException, String>> getSavedLang() async {
    try {
      final langCode = await langLocalDataSource.getSavedLang();
      return Right(langCode);
    } on CacheException {
      return const Left(CacheException());
    }
  }
}
