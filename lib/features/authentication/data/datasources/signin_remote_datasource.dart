import 'dart:async';

import 'package:book_nook_app/core/models/response_model.dart';
import 'package:book_nook_app/core/utils/app_strings.dart';
import 'package:book_nook_app/features/authentication/data/models/signin_claims_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/signin.dart';
import '../../domain/entities/signin_claims.dart';

abstract class SigninRemoteDataSource {
  Future<ResponseModel<SigninClaims>> signin(Signin signin);
}

class SigninRemoteDataSourceImpl implements SigninRemoteDataSource {
  final ApiConsumer apiConsumer;

  SigninRemoteDataSourceImpl({required this.apiConsumer});

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
}
