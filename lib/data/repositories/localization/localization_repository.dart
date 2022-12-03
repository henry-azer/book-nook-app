import 'package:book_nook_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class LocalizationRepository {
  Future<Either<GenericException, String>> getSavedLang();

  Future<Either<GenericException, bool>> changeLang({required String langCode});
}
