import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../entities/authentication/signin.dart';
import '../../entities/authentication/signin_claims.dart';
import '../../entities/user/user.dart';

abstract class AuthenticationRepository {
  Future<Either<GenericException, ResponseModel<User>>> getCurrentUser();

  Future<Either<GenericException, ResponseModel<SigninClaims>>> signin(Signin signin);

  Future<Either<GenericException, ResponseModel<NoParams>>> signout();
}
