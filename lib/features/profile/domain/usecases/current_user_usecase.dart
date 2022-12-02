import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../entities/user.dart';
import '../repositories/profile_repository.dart';

class CurrentUserUseCase implements UseCase<ResponseModel<User>, NoParams> {
  final ProfileRepository profileRepository;

  CurrentUserUseCase({required this.profileRepository});

  @override
  Future<Either<GenericException, ResponseModel<User>>> call(noParams) => profileRepository.findCurrentUser();
}
