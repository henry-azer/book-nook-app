import 'package:book_nook_app/features/book-info/presentation/screens/book_info_screen.dart';
import 'package:book_nook_app/features/bookmark/presentation/screens/bookmark_screen.dart';
import 'package:book_nook_app/features/categories/presentation/screens/categories_screen.dart';
import 'package:book_nook_app/features/signin/presentation/cubit/signin_cubit.dart';
import 'package:book_nook_app/features/signin/presentation/screens/signin_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/cubit/signup_cubit.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_account_info.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_user_info.dart';
import 'package:book_nook_app/features/splash/presentation/cubit/app_welcome_cubit.dart';
import 'package:book_nook_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:book_nook_app/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_strings.dart';
import '../../features/home/presentation/cubit/recommended_books_cubit.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/recommedned_books_screen.dart';
import '../../features/splash/presentation/screens/welcome_screen.dart';
import '../../features/user-info/domain/reading_level.dart';
import '../../features/user-profile/presentation/cubit/signout_cubit.dart';
import '../../features/user-profile/presentation/cubit/user_profile_cubit.dart';
import '../../features/user-profile/presentation/screens/user_profile_screen.dart';

class Routes {
  static const String initial = '/';
  static const String appWelcome = '/app-welcome';
  static const String signin = '/signin';
  static const String signupUserInfo = '/signup-user-info';
  static const String signupAccountInfo = '/signup-account-info';

  // static const String beforehomepage = '/beforehomepage';

  static const String userProfile = '/user-profile';

  static const String home = '/app-home';
  static const String booksSearch = '/books-search';
  static const String booksRecommended = '/books-recommended';
  static const String userRatedBooks = '/user-rated-books';
  static const String bookInfo = '/book-info';
  static const String categories = '/categories';
  static const String bookmark = '/bookmark';
  static const String readingLevel = '/readingLevel';

}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context,) {
          return const BookMarkScreen();
        }, settings: routeSettings);

      case Routes.appWelcome:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<AppWelcomeCubit>()),
            child: const WelcomeScreen(),
          );
        }, settings: routeSettings);

      case Routes.signin:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const SigninScreen(),
          );
        }, settings: routeSettings);

      case Routes.bookmark:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const BookMarkScreen(),
          );
        }, settings: routeSettings);

      case Routes.categories:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SigninCubit>()),
            child: const CategoriesScreen(),
          );
        }, settings: routeSettings);

      case Routes.signupUserInfo:
        return MaterialPageRoute(builder: (context) {
          return const SignupUserInfoScreen();
        }, settings: routeSettings);

      case Routes.signupAccountInfo:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SignupCubit>()),
            child: const SignupAccountInfoScreen(),
          );
        }, settings: routeSettings);

      case Routes.readingLevel:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<SignupCubit>()),
            child: const ReadingLevel(),
          );
        }, settings: routeSettings);

    // case Routes.beforehomepage:
    //   return MaterialPageRoute(builder: (context) {
    //     return BlocProvider(
    //       create: ((context) => di.sl<SigninCubit>()),
    //       child: const BeforeHomePageScreen(),
    //     );
    //   }, settings: routeSettings);

      case Routes.home:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: ((context) => di.sl<UserProfileCubit>()),),
              BlocProvider(create: ((context) => di.sl<RecommendedBooksCubit>()),)
            ],
            child: const HomeScreen(),
          );
        }, settings: routeSettings);

      case Routes.booksRecommended:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: ((context) => di.sl<RecommendedBooksCubit>()),
            child: const RecommendedBooksScreen(),
          );
        }, settings: routeSettings);

      case Routes.bookInfo:
        return MaterialPageRoute(builder: (context) {
          return const BookInfoScreen();
        }, settings: routeSettings);

      case Routes.userProfile:
        return MaterialPageRoute(
            builder: (context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: ((context) => di.sl<UserProfileCubit>()),
                  ),
                  BlocProvider(
                    create: ((context) => di.sl<SignoutCubit>()),
                  )
                ],
                child: const UserProfileScreen(),
              );
            },
            settings: routeSettings);

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
