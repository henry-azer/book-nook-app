import 'package:book_nook_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class LangRepository {
  Future<Either<GenericException, bool>> changeLang({required String langCode});

  Future<Either<GenericException, String>> getSavedLang();
}
