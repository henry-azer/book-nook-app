import 'package:shared_preferences/shared_preferences.dart';

abstract class UserLocalDataSource {}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserLocalDataSourceImpl({required this.sharedPreferences});
}
