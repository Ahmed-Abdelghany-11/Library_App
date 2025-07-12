import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class HomeState extends Equatable {
  final BaseState? homeState;
  final BaseState? getReadingListState;

  const HomeState({this.homeState, this.getReadingListState});

  @override
  List<Object?> get props => [homeState, getReadingListState];

  HomeState copyWith({BaseState? homeState, BaseState? getReadingListState}) {
    return HomeState(
      homeState: homeState ?? this.homeState,
      getReadingListState: getReadingListState ?? this.getReadingListState,
    );
  }
}

sealed class HomeAction {}

class GetAllBooks extends HomeAction {}

class GetReadingList extends HomeAction {}
