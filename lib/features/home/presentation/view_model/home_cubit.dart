import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/home/domain/entity/book_entity.dart';
import 'package:library_app/features/home/domain/usecase/get_all_books_use_case.dart';

import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllBooksUseCase _getAllBooksUseCase;

  HomeCubit(this._getAllBooksUseCase)
    : super(HomeState(homeState: BaseInitialState()));

  Future<void> _getAllBooks() async {
    emit(state.copyWith(homeState: BaseLoadingState()));
    final result = await _getAllBooksUseCase();
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        final books = result.data;
        emit(state.copyWith(homeState: BaseSuccessState(data: books)));
      case FailureResult<List<BookEntity>>():
        emit(
          state.copyWith(
            homeState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void doIntent(HomeAction action) {
    switch (action) {
      case GetAllBooks():
        _getAllBooks();
    }
  }
}
