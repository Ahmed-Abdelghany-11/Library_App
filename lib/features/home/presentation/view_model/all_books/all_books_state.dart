import 'package:equatable/equatable.dart';

import '../../../../../core/base/base_state.dart';

enum BookFilterType { all, category, rating }

class AllBooksState extends Equatable {
  final BaseState? getAllBooksState;
  final BaseState? getBooksByCategoryState;
  final BaseState? getBooksByRatingState;
  final BookFilterType currentFilter;

  const AllBooksState({
    this.getAllBooksState,
    this.getBooksByCategoryState,
    this.getBooksByRatingState,
    this.currentFilter = BookFilterType.all,
  });

  @override
  List<Object?> get props => [
    getAllBooksState,
    getBooksByCategoryState,
    getBooksByRatingState,
    currentFilter,
  ];

  AllBooksState copyWith({
    BaseState? getAllBooksState,
    BaseState? getBooksByCategoryState,
    BaseState? getBooksByRatingState,
    BookFilterType? currentFilter,
  }) {
    return AllBooksState(
      getAllBooksState: getAllBooksState ?? this.getAllBooksState,
      getBooksByCategoryState:
          getBooksByCategoryState ?? this.getBooksByCategoryState,
      getBooksByRatingState:
          getBooksByRatingState ?? this.getBooksByRatingState,
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }
}

sealed class AllBooksAction {}

class GetAllBooks extends AllBooksAction {}

class GetBooksByCategory extends AllBooksAction {}

class GetBooksByRating extends AllBooksAction {}
