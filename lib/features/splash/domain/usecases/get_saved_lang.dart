import 'package:book_nook_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/lang_repository.dart';

class GetSavedLangUseCase implements UseCase<String, NoParams> {
  final LangRepository langRepository;

  GetSavedLangUseCase({required this.langRepository});

  @override
  Future<Either<GenericException, String>> call(NoParams params) async =>
      await langRepository.getSavedLang();
}
