// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:book_nook_app/core/usecases/usecase.dart';
import 'package:book_nook_app/data/entities/book/book.dart';
import 'package:book_nook_app/features/home/presentation/cubit/recommended_books_state.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/models/response_model.dart';
import '../../domain/usecases/recommended_books_usecase.dart';


class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  final RecommendedBooksUseCase recommendedBooksUseCase;

  RecommendedBooksCubit({required this.recommendedBooksUseCase}) : super(RecommendedBooksInitial());

  Future<void> findRecommendedBooks() async {
    emit(RecommendedBooksInitial());
    emit(RecommendedBooksLoading());
    Either<GenericException, ResponseModel<List<Book>>> response = await recommendedBooksUseCase(NoParams());
    emit(response.fold((exception) => RecommendedBooksError(message: exception.message),
        (recommendedBooksResponse) => RecommendedBooksSuccess(recommendedBooksResponse: recommendedBooksResponse)));
  }
}
