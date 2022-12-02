import 'package:book_nook_app/features/profile/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';

abstract class ProfileRepository {
  Future<Either<GenericException, ResponseModel<User>>> findCurrentUser();
}
