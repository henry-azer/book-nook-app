import 'package:bloc/bloc.dart';
import 'package:book_nook_app/features/authentication/domain/entities/signin_claims.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/exceptions.dart';
import '../../domain/entities/signin.dart';
import '../../domain/usecases/signin_usecase.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase signinUseCase;

  SigninCubit({required this.signinUseCase}) : super(SigninInitial());

  Future<void> signin(String email, String password, bool rememberme) async {
    emit(SigninInitial());
    emit(SigninLoading());
    Either<GenericException, SigninClaims> response = await signinUseCase(
        Signin(email: email, password: password, rememberme: rememberme));
    emit(response.fold((exception) => SigninError(message: exception.message),
        (signinClaims) => SigninSuccess(signinClaims: signinClaims)));
  }
}
