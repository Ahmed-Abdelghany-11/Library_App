import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class LibraryBooksState extends Equatable {
  final BaseState? getBooksState;
  final BaseState? deleteBookState;

  const LibraryBooksState({this.getBooksState, this.deleteBookState});

  LibraryBooksState copyWith({
    BaseState? getBooksState,
    BaseState? deleteBookState,
  }) {
    return LibraryBooksState(
      getBooksState: getBooksState ?? this.getBooksState,
      deleteBookState: deleteBookState ?? this.deleteBookState,
    );
  }

  @override
  List<Object?> get props => [getBooksState, deleteBookState];
}

sealed class LibraryBooksAction {}

class GetBooksInReadingList extends LibraryBooksAction {
  final String readingListId;

  GetBooksInReadingList(this.readingListId);
}

class DeleteBookFromReadingList extends LibraryBooksAction {
  final String readingListId;
  final String title;

  DeleteBookFromReadingList(this.title, this.readingListId);
}
