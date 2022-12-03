import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../entities/signin.dart';
import '../entities/signin_claims.dart';
import '../repositories/signin_repository.dart';

class SigninUseCase implements UseCase<ResponseModel<SigninClaims>, Signin> {
  final SigninRepository signinRepository;

  SigninUseCase({required this.signinRepository});

  @override
  Future<Either<GenericException, ResponseModel<SigninClaims>>> call(
          Signin signin) => signinRepository.signin(signin);
}
