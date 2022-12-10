import 'dart:async';

import 'package:book_nook_app/core/models/response_model.dart';
import 'package:book_nook_app/core/utils/app_strings.dart';
import 'package:book_nook_app/data/entities/book/book.dart';

import '../../../core/api/api_consumer.dart';
import '../../../core/api/end_points.dart';
import '../../../core/error/exceptions.dart';
import '../../models/book/book_model.dart';

abstract class BookRemoteDataSource {
  Future<ResponseModel<List<Book>>> findRecommendedBooks();
}

class BookRemoteDataSourceImpl implements BookRemoteDataSource {
  final ApiConsumer apiConsumer;

  BookRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<ResponseModel<List<Book>>> findRecommendedBooks() async {
    final response = await apiConsumer.get(EndPoints.recommendedBooks);
    if (response[AppStrings.success].toString() == AppStrings.boolFalse) {
      throw GenericException(message: response[AppStrings.message]);
    } else {
      return ResponseModel(
          success: response[AppStrings.success],
          message: response[AppStrings.message],
          body: List<Book>.from(response[AppStrings.body].map((book) => BookModel.fromJson(book))));
    }
  }
}
