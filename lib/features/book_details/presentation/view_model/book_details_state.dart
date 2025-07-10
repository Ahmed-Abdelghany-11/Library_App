import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

import '../../domain/entity/add_review_entity.dart';

class BookDetailsState extends Equatable {
  final BaseState? getReviewState;
  final BaseState? addReviewState;
  final BaseState? getUserDataState;

  const BookDetailsState({
    this.getReviewState,
    this.addReviewState,
    this.getUserDataState,
  });

  @override
  List<Object?> get props => [getReviewState, addReviewState, getUserDataState];

  BookDetailsState copyWith({
    BaseState? getReviewState,
    BaseState? addReviewState,
    BaseState? getUserDataState,
  }) {
    return BookDetailsState(
      getReviewState: getReviewState ?? this.getReviewState,
      addReviewState: addReviewState ?? this.addReviewState,
      getUserDataState: getUserDataState ?? this.getUserDataState,
    );
  }
}

sealed class BookDetailsAction {}

class GetBookReviews extends BookDetailsAction {
  final String bookId;

  GetBookReviews(this.bookId);
}

class AddBookReview extends BookDetailsAction {
  final String bookId;
  final String userId;
  final String username;

  AddBookReview(this.bookId, this.userId, this.username);
}

class GetUserData extends BookDetailsAction {}
