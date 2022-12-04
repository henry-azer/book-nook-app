import 'dart:async';

import 'package:book_nook_app/core/models/response_model.dart';
import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/core/utils/app_strings.dart';
import 'package:book_nook_app/data/models/authentication/signin_claims_model.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';
import '../../entities/authentication/signin_claims.dart';
import '../../entities/user/user.dart';
import '../../models/user/user_model.dart';
import '../../entities/authentication/signin.dart';

abstract class AuthenticationRemoteDataSource {
  Future<ResponseModel<User>> findCurrentUser();

  Future<ResponseModel<SigninClaims>> signin(Signin signin);

  Future<ResponseModel<NoParams>> signout();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final ApiConsumer apiConsumer;

  AuthenticationRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<User>> findCurrentUser() async {
    final response = await apiConsumer.get(EndPoints.currentUser);
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          model: UserModel.fromJson(response[AppStrings.body]));
    }
  }

  @override
  Future<ResponseModel<SigninClaims>> signin(Signin signin) async {
    final response = await apiConsumer.post(EndPoints.signin, body: signin.toJson());
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success], message: response[AppStrings.message],
          model: SigninClaimsModel.fromJson(response[AppStrings.body]));
    }
  }

  @override
  Future<ResponseModel<NoParams>> signout() async {
    final response = await apiConsumer.get(EndPoints.signout);
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(success: response[AppStrings.success],
          message: response[AppStrings.message], model: NoParams());
    }
  }
}
