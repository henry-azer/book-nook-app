import 'dart:async';

import 'package:book_nook_app/core/models/response_model.dart';
import 'package:book_nook_app/core/utils/app_strings.dart';
import 'package:book_nook_app/data/entities/user/signup.dart';
import 'package:book_nook_app/data/entities/user/user.dart';
import 'package:book_nook_app/data/models/user/user_model.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';

abstract class UserRemoteDataSource {
  Future<ResponseModel<User>> signup(Signup signup);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiConsumer apiConsumer;

  UserRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<User>> signup(Signup signup) async {
    final response = await apiConsumer.post(EndPoints.signup, body: signup.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          body: UserModel.fromJson(response[AppStrings.body]));
    }
  }
}
