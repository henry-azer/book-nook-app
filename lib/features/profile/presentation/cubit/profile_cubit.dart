import 'package:bloc/bloc.dart';
import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUserCase;

  ProfileCubit({required this.profileUserCase}) : super(ProfileInitial());

  Future<void> findCurrentUser() async {
    emit(ProfileInitial());
    emit(ProfileLoading());
    Either<GenericException, User> response = await profileUserCase(NoParams());
    emit(response.fold((exception) => ProfileError(message: exception.message),
        (user) => ProfileSuccess(user: user)));
  }
}
