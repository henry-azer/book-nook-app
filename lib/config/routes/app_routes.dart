import 'package:book_nook_app/features/profile/presentation/cubit/signout_cubit.dart';
import 'package:book_nook_app/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/signin/presentation/screens/signin_screen.dart';
import 'package:book_nook_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:book_nook_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/cubit/signup_cubit.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_screen_II.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_screen.dart';
import 'package:book_nook_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:book_nook_app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../features/splash/presentation/screens/welcome_screen.dart';

class Routes {
  static const String initial = '/';
  static const String welcome = '/welcome';
  static const String signin = '/signin';
  static const String signup1 = '/signup1';
  static const String signup2 = '/signup2';

  // static const String beforehomepage = '/beforehomepage';
  static const String profile = '/profile';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context,) {
          return const SplashScreen();
        }, settings: routeSettings);

      case Routes.welcome:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        }, settings: routeSettings);

      case Routes.signin:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const SigninScreen(),
          );
        }, settings: routeSettings);

      case Routes.signup1:
        return MaterialPageRoute(builder: (context) {
          return const SignupScreen();
        }, settings: routeSettings);

      case Routes.signup2:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SignupCubit>()),
            child: const SignupScreenII(),
          );
        }, settings: routeSettings);

    // case Routes.beforehomepage:
    //   return MaterialPageRoute(builder: (context) {
    //     return BlocProvider(
    //       create: ((context) => di.sl<SigninCubit>()),
    //       child: const BeforeHomePageScreen(),
    //     );
    //   }, settings: routeSettings);

      case Routes.profile:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: ((context) => di.sl<ProfileCubit>()),),
              BlocProvider(create: ((context) => di.sl<SignoutCubit>()),)
            ],
            child: const ProfileScreen(),
          );
        }, settings: routeSettings);

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: ((context) =>
        const Scaffold(
          body: Center(
            child: Text(AppStrings.noRouteFound),
          ),
        )));
  }
}
