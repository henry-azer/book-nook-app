import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../entities/signin_claims.dart';
import '../entities/signin.dart';

abstract class SigninRepository {
  Future<Either<GenericException, ResponseModel<SigninClaims>>> signin(Signin signin);
}
