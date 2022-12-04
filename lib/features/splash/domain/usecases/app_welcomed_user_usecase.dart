import 'package:book_nook_app/data/repositories/user/user_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/usecases/usecase.dart';

class AppWelcomedUserUseCase implements UseCase<NoParams, NoParams> {
  final UserRepository userRepository;

  AppWelcomedUserUseCase({required this.userRepository});

  @override
  Future<Either<GenericException, NoParams>> call(NoParams noParams) async =>
      await userRepository.setAppWelcomedUser();
}
