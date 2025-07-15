import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/features/search/presentation/view_model/search_state.dart';

import '../../../../core/utils/networking/api_result.dart';
import '../../../home/domain/entity/book_entity.dart';
import '../../domain/usecase/search_use_case.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  SearchCubit(this._searchUseCase)
    : super(SearchState(searchState: BaseInitialState()));

  final TextEditingController searchController = TextEditingController();

  Future<void> _search(String query) async {
    emit(state.copyWith(searchState: BaseLoadingState()));
    final result = await _searchUseCase(query);
    switch (result) {
      case SuccessResult<List<BookEntity>>():
        final searchResults = result.data;
        emit(
          state.copyWith(searchState: BaseSuccessState(data: searchResults)),
        );
      case FailureResult<List<BookEntity>>():
        emit(
          state.copyWith(
            searchState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void _onSearchChanged() {
    final query = searchController.text.trim();
    if (query.isNotEmpty) {
      doIntent(SearchBooks(query));
    }
  }

  void doIntent(SearchAction action) {
    switch (action) {
      case SearchBooks(query: final query):
        _search(query);
      case OnSearchChanged():
        _onSearchChanged();
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
