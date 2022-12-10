import 'package:equatable/equatable.dart';

import '../../../../core/models/response_model.dart';
import '../../../../data/entities/book/book.dart';

abstract class RecommendedBooksState extends Equatable {
  const RecommendedBooksState();

  @override
  List<Object> get props => [];
}

class RecommendedBooksInitial extends RecommendedBooksState {}

class RecommendedBooksLoading extends RecommendedBooksState {}

class RecommendedBooksSuccess extends RecommendedBooksState {
  final ResponseModel<List<Book>> recommendedBooksResponse;

  const RecommendedBooksSuccess({required this.recommendedBooksResponse});

  @override
  List<Object> get props => [recommendedBooksResponse];
}

class RecommendedBooksError extends RecommendedBooksState {
  final String message;

  const RecommendedBooksError({required this.message});

  @override
  List<Object> get props => [message];
}
