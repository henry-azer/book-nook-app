import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'features/signin/presentation/cubit/signin_cubit.dart';
import 'features/splash/presentation/cubit/app_welcome_cubit.dart';
import 'features/splash/presentation/cubit/localization_cubit.dart';
import 'features/user-profile/presentation/cubit/signout_cubit.dart';
import 'features/user-profile/presentation/cubit/user_profile_cubit.dart';
import 'features/user-recommended-books/presentation/cubit/recommended_books_cubit.dart';
import 'injection_container.dart' as di;

class BookNookApp extends StatelessWidget {
  const BookNookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<LocalizationCubit>()),
          BlocProvider(create: ((context) => di.sl<AppWelcomeCubit>())),
          BlocProvider(create: ((context) => di.sl<SigninCubit>())),
          BlocProvider(create: ((context) => di.sl<SignoutCubit>())),
          BlocProvider(create: ((context) => di.sl<UserProfileCubit>())),
          BlocProvider(create: ((context) => di.sl<RecommendedBooksCubit>()))
        ],
        child: BlocBuilder<LocalizationCubit, LocalizationState>(
          buildWhen: (previousState, currentState) {
            return previousState != currentState;
          },
          builder: (context, state) {
            return MaterialApp(
              title: AppStrings.appName,
              locale: state.locale,
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              onGenerateRoute: AppRoutes.onGenerateRoute,
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
            );
          },
        ));
  }
}
