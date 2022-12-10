import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/entities/book/book.dart';
import 'package:book_nook_app/data/repositories/book/book_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';

class RecommendedBooksUseCase
    implements UseCase<ResponseModel<List<Book>>, NoParams> {
  final BookRepository bookRepository;

  RecommendedBooksUseCase({required this.bookRepository});

  @override
  Future<Either<GenericException, ResponseModel<List<Book>>>> call(noParams)
      async => await bookRepository.findRecommendedBooks();
}
