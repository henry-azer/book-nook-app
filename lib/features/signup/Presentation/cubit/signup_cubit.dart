// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_nook_app/data/entities/user/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../../../data/entities/user/signup.dart';
import '../../domain/entities/signup_request.dart';
import '../../domain/usecases/signup_usecase.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  Future<void> signup(SignupRequest signupRequest) async {
    emit(SignupInitial());
    emit(SignupLoading());
    Either<GenericException, ResponseModel<User>> response =
        await signupUseCase(Signup(
            firstName: signupRequest.firstname,
            lastName: signupRequest.lastname,
            email: signupRequest.email,
            password: signupRequest.password,
            birthdate: getFormattedBirthdate(signupRequest),
            phoneNumber: signupRequest.phoneNumber));
    emit(response.fold((exception) => SignupError(message: exception.message),
        (userResponse) => SignupSuccess(userResponse: userResponse)));
  }

  getFormattedBirthdate(SignupRequest signupRequest) {
    return "${signupRequest.birthYear}-${signupRequest.birthMonth}-${signupRequest.birthDay}";
  }
}
