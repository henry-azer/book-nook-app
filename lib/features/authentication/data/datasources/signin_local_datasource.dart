import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/signin.dart';
import '../../domain/entities/signin_claims.dart';

abstract class SigninLocalDataSource {
  Future<void> cacheSigninClaims(Signin signin, SigninClaims signinClaims);

  Future<void> cacheIsUserLogging();
}

class SigninLocalDataSourceImpl implements SigninLocalDataSource {
  final SharedPreferences sharedPreferences;

  SigninLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheSigninClaims(
      Signin signin, SigninClaims signinClaims) async {
    sharedPreferences.setBool(AppStrings.cachedIsAuthenticated, true);
    sharedPreferences.setBool(AppStrings.cachedRememberMe, signin.rememberme);
    sharedPreferences.setString(AppStrings.cachedSignin, json.encode(signin));
    sharedPreferences.setString(AppStrings.cachedSigninClaims, json.encode(signinClaims));
    sharedPreferences.setBool(AppStrings.cachedIsUserLogging, false);
  }

  @override
  Future<void> cacheIsUserLogging() async {
    sharedPreferences.setBool(AppStrings.cachedIsUserLogging, true);
  }
}
