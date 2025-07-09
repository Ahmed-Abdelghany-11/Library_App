import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class HomeState extends Equatable {
  final BaseState? homeState;

  const HomeState({this.homeState});

  @override
  List<Object?> get props => [homeState];

  HomeState copyWith({BaseState? homeState}) {
    return HomeState(homeState: homeState ?? this.homeState);
  }
}

sealed class HomeAction {}

class GetAllBooks extends HomeAction {}
