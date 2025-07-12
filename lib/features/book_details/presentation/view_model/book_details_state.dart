import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';

class BookDetailsState extends Equatable {
  final BaseState? getReviewState;
  final BaseState? addReviewState;
  final BaseState? getUserDataState;
  final BaseState? getUserReadingListsState;
  final BaseState? addBookToReadingListState;
  final int selectedRating;

  const BookDetailsState({
    this.getReviewState,
    this.addReviewState,
    this.getUserDataState,
    this.getUserReadingListsState,
    this.addBookToReadingListState,
    this.selectedRating = 0,
  });

  @override
  List<Object?> get props => [
    getReviewState,
    addReviewState,
    getUserDataState,
    getUserReadingListsState,
    addBookToReadingListState,
    selectedRating,
  ];

  BookDetailsState copyWith({
    BaseState? getReviewState,
    BaseState? addReviewState,
    BaseState? getUserDataState,
    BaseState? getUserReadingListsState,
    BaseState? addBookToReadingListState,
    int? selectedRating,
  }) {
    return BookDetailsState(
      getReviewState: getReviewState ?? this.getReviewState,
      addReviewState: addReviewState ?? this.addReviewState,
      getUserDataState: getUserDataState ?? this.getUserDataState,
      getUserReadingListsState:
          getUserReadingListsState ?? this.getUserReadingListsState,
      addBookToReadingListState:
          addBookToReadingListState ?? this.addBookToReadingListState,
      selectedRating: selectedRating ?? this.selectedRating,
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

class AddBookToReadingList extends BookDetailsAction {
  final String readingListId;
  final BookEntity book;

  AddBookToReadingList(this.readingListId, this.book);
}

class GetUserReadingLists extends BookDetailsAction {}
