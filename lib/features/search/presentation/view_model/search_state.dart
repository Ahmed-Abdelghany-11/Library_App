import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class SearchState extends Equatable {
  final BaseState? searchState;
  const SearchState({this.searchState});

  @override
  List<Object?> get props => [searchState];

  SearchState copyWith({BaseState? searchState}) {
    return SearchState(searchState: searchState ?? this.searchState);
  }
}

sealed class SearchAction {}

class SearchBooks extends SearchAction {
  final String query;

  SearchBooks(this.query);
}
