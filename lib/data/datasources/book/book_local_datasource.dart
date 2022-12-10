import 'package:shared_preferences/shared_preferences.dart';

abstract class BookLocalDataSource {}

class BookLocalDataSourceImpl implements BookLocalDataSource {
  final SharedPreferences sharedPreferences;

  BookLocalDataSourceImpl({required this.sharedPreferences});
}
