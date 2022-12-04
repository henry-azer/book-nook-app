import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/entities/user/signup.dart';
import 'package:book_nook_app/data/entities/user/user.dart';
import 'package:book_nook_app/data/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';

class SignupUseCase implements UseCase<ResponseModel<User>, Signup> {
  final UserRepository userRepository;

  SignupUseCase({required this.userRepository});

  @override
  Future<Either<GenericException, ResponseModel<User>>> call(Signup signup) async =>
      await userRepository.signup(signup);
}
