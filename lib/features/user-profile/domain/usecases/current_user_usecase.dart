import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/repositories/authentication/authentication_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/user/user.dart';

class CurrentUserUseCase implements UseCase<ResponseModel<User>, NoParams> {
  final AuthenticationRepository authenticationRepository;

  CurrentUserUseCase({required this.authenticationRepository});

  @override
  Future<Either<GenericException, ResponseModel<User>>> call(noParams) async =>
      await authenticationRepository.getCurrentUser();
}
