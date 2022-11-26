import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class ProfileUseCase implements UseCase<User, NoParams> {
  final ProfileRepository profileRepository;

  ProfileUseCase({required this.profileRepository});

  @override
  Future<Either<GenericException, User>> call(noParams) => profileRepository.findCurrentUser();
}
