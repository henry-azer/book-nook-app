import 'package:book_nook_app/features/book-info/presentation/screens/book_info_screen.dart';
import 'package:book_nook_app/features/signin/presentation/screens/signin_screen.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_account_info.dart';
import 'package:book_nook_app/features/signup/Presentation/screens/signup_user_info.dart';
import 'package:book_nook_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:book_nook_app/features/user-rated-book/presentation/screens/user_rated_books_screen.dart';
import 'package:book_nook_app/features/user-welcome/presentation/screens/user_welcome_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/book-categories/presentation/screens/book_categories_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/splash/presentation/screens/welcome_screen.dart';
import '../../features/user-profile/presentation/screens/user_profile_screen.dart';
import '../../features/user-recommended-books/presentation/screens/user_recommended_books_screen.dart';

class Routes {
  static const String initial = '/';
  static const String appHome = '/app-home';
  static const String appWelcome = '/app-welcome';

  static const String signin = '/signin';
  static const String signupUserInfo = '/signup-user-info';
  static const String signupAccountInfo = '/signup-account-info';

  static const String booksCategories = '/books-categories';
  static const String booksSearch = '/books-search';
  static const String bookInfo = '/book-info';

  static const String userRecommendedBooks = '/user-recommended-books';
  static const String userRatedBooks = '/user-rated-books';
  static const String userProfile = '/user-profile';
  static const String userWelcome = '/user-welcome';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (context,) {
          return const SplashScreen();
        }, settings: routeSettings);

      case Routes.appWelcome:
        return MaterialPageRoute(builder: (context) {
          return const WelcomeScreen();
        }, settings: routeSettings);

      case Routes.signin:
        return MaterialPageRoute(builder: (context) {
          return const SigninScreen();
        }, settings: routeSettings);

      case Routes.signupUserInfo:
        return MaterialPageRoute(builder: (context) {
          return const SignupUserInfoScreen();
        }, settings: routeSettings);

      case Routes.signupAccountInfo:
        return MaterialPageRoute(builder: (context) {
          return const SignupAccountInfoScreen();
        }, settings: routeSettings);

    case Routes.userWelcome:
      return MaterialPageRoute(builder: (context) {
        return const UserWelcomeScreen();
      }, settings: routeSettings);

      case Routes.appHome:
        return MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }, settings: routeSettings);

      case Routes.userRecommendedBooks:
        return MaterialPageRoute(builder: (context) {
          return const UserRecommendedBooksScreen();
        }, settings: routeSettings);

      case Routes.bookInfo:
        return MaterialPageRoute(builder: (context) {
          return const BookInfoScreen();
        }, settings: routeSettings);

      case Routes.userRatedBooks:
        return MaterialPageRoute(builder: (context) {
          return const UserRatedBooksScreen();
        }, settings: routeSettings);

      case Routes.booksCategories:
        return MaterialPageRoute(builder: (context) {
          return const BookCategoriesScreen();
        }, settings: routeSettings);

      case Routes.userProfile:
        return MaterialPageRoute(builder: (context) {
          return const UserProfileScreen();
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
