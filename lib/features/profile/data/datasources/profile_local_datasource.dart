import 'dart:convert';

import 'package:book_nook_app/features/profile/data/models/user_model.dart';
import 'package:book_nook_app/features/profile/domain/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';

abstract class ProfileLocalDataSource {
  Future<User> getCurrentUser();

  Future<void> cacheCurrentUser(User user);
}

class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<User> getCurrentUser() async {
    final jsonString =
        sharedPreferences.getString(AppStrings.cachedCurrentUser);
    if (jsonString != null) {
      final cachedCurrentUser =
          Future.value(UserModel.fromJson(json.decode(jsonString)));
      return cachedCurrentUser;
    } else {
      throw const CacheException();
    }
  }

  @override
  Future<void> cacheCurrentUser(User user) async {
    sharedPreferences.setString(
        AppStrings.cachedCurrentUser, json.encode(user));
  }
}
