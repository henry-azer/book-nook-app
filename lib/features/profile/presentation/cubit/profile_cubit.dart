// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/user/user.dart';
import '../../domain/usecases/current_user_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final CurrentUserUseCase profileUserCase;

  ProfileCubit({required this.profileUserCase}) : super(ProfileInitial());

  Future<void> findCurrentUser() async {
    emit(ProfileInitial());
    emit(ProfileLoading());
    Either<GenericException, ResponseModel<User>> response = await profileUserCase(NoParams());
    emit(response.fold((exception) => ProfileError(message: exception.message),
        (userResponse) => ProfileSuccess(user: userResponse.model, userResponse: userResponse)));
  }
}
