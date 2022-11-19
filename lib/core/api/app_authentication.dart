import 'dart:convert';

import 'package:book_nook_app/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppAuthentication {
  String getBearerToken();

  bool isUserAuthenticated();
}

class AppAuthenticationImpl extends AppAuthentication {
  final SharedPreferences sharedPreferences;

  AppAuthenticationImpl({required this.sharedPreferences});

  @override
  String getBearerToken() {
    var signinClaims =
        jsonDecode(sharedPreferences.getString(AppStrings.cachedSigninClaims)!)
            as Map<String, dynamic>;
    return signinClaims[AppStrings.accessToken];
  }

  @override
  bool isUserAuthenticated() {
    return sharedPreferences.getBool(AppStrings.cachedIsAuthenticated) ?? false;
  }
}
