import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/repositories/authentication/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';

class SignoutUseCase implements UseCase<ResponseModel<NoParams>, NoParams> {
  final AuthenticationRepository authenticationRepository;

  SignoutUseCase({required this.authenticationRepository});

  @override
  Future<Either<GenericException, ResponseModel<NoParams>>> call(noParams) async => await authenticationRepository.signout();
}
