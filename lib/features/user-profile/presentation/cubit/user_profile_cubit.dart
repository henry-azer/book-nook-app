// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/user/user.dart';
import '../../domain/usecases/current_user_usecase.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final CurrentUserUseCase profileUserCase;

  UserProfileCubit({required this.profileUserCase}) : super(UserProfileInitial());

  Future<void> findCurrentUser() async {
    emit(UserProfileInitial());
    emit(UserProfileLoading());
    Either<GenericException, ResponseModel<User>> response = await profileUserCase(NoParams());
    emit(response.fold((exception) => UserProfileError(message: exception.message),
        (userResponse) => UserProfileSuccess(user: userResponse.model, userResponse: userResponse)));
  }
}
