import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/book_details/domain/entity/review_entity.dart';

import '../../domain/entity/add_review_entity.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecase/add_book_review_use_case.dart';
import '../../domain/usecase/get_book_reviews_use_case.dart';
import '../../domain/usecase/get_use_data_use_case.dart';
import 'book_details_state.dart';

@injectable
class BookDetailsCubit extends Cubit<BookDetailsState> {
  final AddBookReviewUseCase _addBookReviewUseCase;
  final GetBookReviewsUseCase _getBookReviewsUseCase;
  final GetUseDataUseCase _getUseDataUseCase;

  BookDetailsCubit(
    this._addBookReviewUseCase,
    this._getBookReviewsUseCase,
    this._getUseDataUseCase,
  ) : super(
        BookDetailsState(
          addReviewState: BaseInitialState(),
          getReviewState: BaseInitialState(),
          getUserDataState: BaseInitialState(),
        ),
      );

  final TextEditingController reviewTextController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  int selectedRating = 0;

  Future<void> _getBookReviews(String bookId) async {
    emit(state.copyWith(getReviewState: BaseLoadingState()));
    final result = await _getBookReviewsUseCase.call(bookId);
    switch (result) {
      case SuccessResult<List<ReviewEntity>>():
        emit(
          state.copyWith(getReviewState: BaseSuccessState(data: result.data)),
        );
      case FailureResult<List<ReviewEntity>>():
        emit(
          state.copyWith(
            getReviewState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _addBookReview(
    String bookId,
    String userId,
    String username,
  ) async {
    emit(state.copyWith(addReviewState: BaseLoadingState()));
    final result = await _addBookReviewUseCase.call(
      AddReviewEntity(
        bookId: bookId,
        reviewText: reviewTextController.text,
        rating: int.parse(ratingController.text),
        userId: userId,
        username: username,
      ),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(addReviewState: BaseSuccessState()));
        await _getBookReviews(bookId);
        reviewTextController.clear();
        ratingController.clear();
      case FailureResult<void>():
        emit(
          state.copyWith(
            addReviewState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _getUserData() async {
    emit(state.copyWith(getUserDataState: BaseLoadingState()));
    final result = await _getUseDataUseCase.call();
    switch (result) {
      case SuccessResult<UserEntity>():
        emit(
          state.copyWith(getUserDataState: BaseSuccessState(data: result.data)),
        );
      case FailureResult<UserEntity>():
        emit(
          state.copyWith(
            getUserDataState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void updateSelectedRating(int rating) {
    selectedRating = rating;
    ratingController.text = rating.toString();
    emit(state.copyWith());
  }

  void doIntent(BookDetailsAction action) {
    switch (action) {
      case GetBookReviews():
        _getBookReviews(action.bookId);
      case AddBookReview():
        _addBookReview(action.bookId, action.userId, action.username);
      case GetUserData():
        _getUserData();
    }
  }

  @override
  Future<void> close() {
    reviewTextController.dispose();
    ratingController.dispose();
    return super.close();
  }
}
