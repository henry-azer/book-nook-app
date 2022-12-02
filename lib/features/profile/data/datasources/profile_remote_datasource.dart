import 'package:book_nook_app/core/models/response_model.dart';
import 'package:book_nook_app/features/profile/domain/entities/user.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ResponseModel<User>> findCurrentUser();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProfileRemoteDataSourceImpl({required this.apiConsumer});

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
}
