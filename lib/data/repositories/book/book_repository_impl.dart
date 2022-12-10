import 'package:book_nook_app/data/datasources/book/book_local_datasource.dart';
import 'package:book_nook_app/data/datasources/book/book_remote_datasource.dart';
import 'package:book_nook_app/data/repositories/book/book_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/models/response_model.dart';
import '../../../core/network/network_info.dart';
import '../../entities/book/book.dart';

class BookRepositoryImpl implements BookRepository {
  final NetworkInfo networkInfo;
  final BookLocalDataSource bookLocalDataSource;
  final BookRemoteDataSource bookRemoteDataSource;

  BookRepositoryImpl(
      {required this.networkInfo,
      required this.bookLocalDataSource,
      required this.bookRemoteDataSource});

  @override
  Future<Either<GenericException, ResponseModel<List<Book>>>> findRecommendedBooks() async {
    if (await networkInfo.isConnected) {
      try {
        final recommendedBooksResponse = await bookRemoteDataSource.findRecommendedBooks();
        return Right(recommendedBooksResponse);
      } on GenericException catch (exception) {
        return Left(exception);
      }
    } else {
      return const Left(CacheException());
    }
  }
}
