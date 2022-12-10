import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../entities/book/book.dart';

abstract class BookRepository {
  Future<Either<GenericException, ResponseModel<List<Book>>>> findRecommendedBooks();
}
