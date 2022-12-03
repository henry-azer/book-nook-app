import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/authentication/signin.dart';
import '../../../../data/entities/authentication/signin_claims.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';

class SigninUseCase implements UseCase<ResponseModel<SigninClaims>, Signin> {
  final AuthenticationRepository signinRepository;

  SigninUseCase({required this.signinRepository});

  @override
  Future<Either<GenericException, ResponseModel<SigninClaims>>> call(Signin signin) async =>
      await signinRepository.signin(signin);
}
