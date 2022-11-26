import 'package:book_nook_app/features/authentication/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/authentication/presentation/screens/signin_screen.dart';
import 'package:book_nook_app/features/beforehome/presentation/screens/beforehomepage_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signupII_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signupI_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/widgets/signupII_form_widget.dart';
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
  static const String signup1 = '/signup1';
  static const String signup2 = '/signup2';
  static const String beforehomepage = '/beforehomepage';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context) {
          return const BeforeHomePageScreen();
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

      case Routes.signup1:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const SignupScreen(),
          );
        });

      case Routes.signup2:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const SignupIIScreen(),
          );
        });

      case Routes.beforehomepage:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const BeforeHomePageScreen(),
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
