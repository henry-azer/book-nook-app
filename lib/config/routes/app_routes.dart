import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/authentication/presentation/screens/signin_screen.dart';
import 'package:book_nook_app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/splash/presentation/screens/welcome_screen.dart';

class Routes {
  static const String initial = '/';
  static const String welcome = '/welcome';
  static const String signin = '/signin';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        });

      case Routes.welcome:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        });

      case Routes.signin:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const SigninScreen(),
          );
        });

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) => const Scaffold(
              body: Center(
                child: Text(AppStrings.noRouteFound),
              ),
            )));
  }
}
