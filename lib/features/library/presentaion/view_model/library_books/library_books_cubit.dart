import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/networking/api_result.dart';
import '../../../../home/domain/entity/book_entity.dart';
import '../../../domain/usecase/get_books_in_reading_list_use_case.dart';
import '../../../domain/usecase/remove_book_from_reading_list_use_case.dart';
import 'library_books_state.dart';

@injectable
class LibraryBooksCubit extends Cubit<LibraryBooksState> {
  final GetBooksInReadingListUseCase _getBooksInReadingListUseCase;
  final RemoveBookFromReadingListUseCase _removeBookFromReadingListUseCase;
  LibraryBooksCubit(
    this._getBooksInReadingListUseCase,
    this._removeBookFromReadingListUseCase,
  ) : super(
        LibraryBooksState(
          getBooksState: BaseInitialState(),
          deleteBookState: BaseInitialState(),
        ),
      );

  void doIntent(LibraryBooksAction action) {
    switch (action) {
      case GetBooksInReadingList():
        _getBooksInReadingList(action.readingListId);
        break;
      case DeleteBookFromReadingList():
        _removeBookFromReadingList(action.readingListId, action.title);
        break;
    }
  }

  Future<void> _getBooksInReadingList(String readingListId) async {
    emit(state.copyWith(getBooksState: BaseLoadingState()));
    final result = await _getBooksInReadingListUseCase(readingListId);
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        emit(
          state.copyWith(getBooksState: BaseSuccessState(data: result.data)),
        );
      case FailureResult():
        emit(
          state.copyWith(
            getBooksState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  Future<void> _removeBookFromReadingList(
    String readingListId,
    String title,
  ) async {
    emit(state.copyWith(deleteBookState: BaseLoadingState()));
    final result = await _removeBookFromReadingListUseCase(
      readingListId,
      title,
    );
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(deleteBookState: BaseSuccessState()));
        _getBooksInReadingList(readingListId);
      case FailureResult():
        emit(
          state.copyWith(
            deleteBookState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }
}
