part of 'signin_cubit.dart';

abstract class SigninState extends Equatable {
  const SigninState();

  @override
  List<Object> get props => [];
}

class SigninInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final SigninClaims signinClaims;

  const SigninSuccess({required this.signinClaims});

  @override
  List<Object> get props => [signinClaims];
}

class SigninError extends SigninState {
  final String message;

  const SigninError({required this.message});

  @override
  List<Object> get props => [message];
}
