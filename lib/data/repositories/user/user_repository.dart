import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/entities/user/signup.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../entities/user/user.dart';

abstract class UserRepository {
  Future<Either<GenericException, ResponseModel<User>>> signup(Signup signup);

  Future<Either<GenericException, NoParams>> setAppWelcomedUser();
}
