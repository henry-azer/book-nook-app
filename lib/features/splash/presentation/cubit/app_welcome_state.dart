import 'package:equatable/equatable.dart';

abstract class AppWelcomeState extends Equatable {
  const AppWelcomeState();

  @override
  List<Object> get props => [];
}

class AppWelcomeInitial extends AppWelcomeState {}