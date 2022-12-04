import 'package:book_nook_app/features/splash/presentation/cubit/app_welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/app_welcomed_user_usecase.dart';

class AppWelcomeCubit extends Cubit<AppWelcomeState> {
  final AppWelcomedUserUseCase appWelcomedUserUserCase;

  AppWelcomeCubit({required this.appWelcomedUserUserCase}) : super(AppWelcomeInitial());

  Future<void> setAppWelcomedUser() async {
    await appWelcomedUserUserCase.call(NoParams());
  }
}
