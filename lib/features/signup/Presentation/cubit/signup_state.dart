part of 'signup_cubit.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  final ResponseModel<User> userResponse;

  const SignupSuccess({required this.userResponse});

  @override
  List<Object> get props => [userResponse];
}

class SignupError extends SignupState {
  final String message;

  const SignupError({required this.message});

  @override
  List<Object> get props => [message];
}
