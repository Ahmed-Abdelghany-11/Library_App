import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/features/home/domain/usecase/get_all_books_use_case.dart';

import '../../../../../core/utils/networking/api_result.dart';
import '../../../domain/entity/book_entity.dart';
import '../../../domain/usecase/get_books_by_category_use_case.dart';
import '../../../domain/usecase/get_books_by_rating_use_case.dart';
import 'all_books_state.dart';

@injectable
class AllBooksCubit extends Cubit<AllBooksState> {
  final GetAllBooksUseCase _allBooksUseCase;
  final GetBooksByCategoryUseCase _booksByCategoryUseCase;
  final GetBooksByRatingUseCase _booksByRatingUseCase;
  AllBooksCubit(
    this._allBooksUseCase,
    this._booksByCategoryUseCase,
    this._booksByRatingUseCase,
  ) : super(
        AllBooksState(
          getAllBooksState: BaseInitialState(),
          getBooksByCategoryState: BaseInitialState(),
          getBooksByRatingState: BaseInitialState(),
        ),
      );

  final TextEditingController categoryController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();

  Future<void> _getAllBooks() async {
    emit(
      state.copyWith(
        getAllBooksState: BaseLoadingState(),
        currentFilter: BookFilterType.all,
      ),
    );
    final result = await _allBooksUseCase();
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getAllBooksState: BaseSuccessState(data: result.data),
            currentFilter: BookFilterType.all,
          ),
        );
      case FailureResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getAllBooksState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
            currentFilter: BookFilterType.all,
          ),
        );
    }
  }

  Future<void> _getBooksByCategory() async {
    emit(
      state.copyWith(
        getBooksByCategoryState: BaseLoadingState(),
        currentFilter: BookFilterType.category,
      ),
    );
    final result = await _booksByCategoryUseCase(categoryController.text);
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getBooksByCategoryState: BaseSuccessState(data: result.data),
            currentFilter: BookFilterType.category,
          ),
        );
      case FailureResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getBooksByCategoryState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
            currentFilter: BookFilterType.category,
          ),
        );
    }
  }

  Future<void> _getBooksByRating() async {
    emit(
      state.copyWith(
        getBooksByRatingState: BaseLoadingState(),
        currentFilter: BookFilterType.rating,
      ),
    );
    final result = await _booksByRatingUseCase(
      double.parse(ratingController.text),
    );
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getBooksByRatingState: BaseSuccessState(data: result.data),
            currentFilter: BookFilterType.rating,
          ),
        );
      case FailureResult<List<BookEntity>>():
        emit(
          state.copyWith(
            getBooksByRatingState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
            currentFilter: BookFilterType.rating,
          ),
        );
    }
  }

  void doIntent(AllBooksAction action) {
    switch (action) {
      case GetAllBooks():
        _getAllBooks();
      case GetBooksByCategory():
        _getBooksByCategory();
      case GetBooksByRating():
        _getBooksByRating();
    }
  }

  @override
  Future<void> close() {
    categoryController.dispose();
    ratingController.dispose();
    return super.close();
  }
}
