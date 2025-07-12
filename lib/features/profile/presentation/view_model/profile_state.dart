import 'package:equatable/equatable.dart';
import 'package:library_app/core/base/base_state.dart';

class ProfileState extends Equatable {
  final BaseState? profileState;
  final BaseState? logoutState;

  const ProfileState({this.profileState, this.logoutState});

  @override
  List<Object?> get props => [profileState, logoutState];

  ProfileState copyWith({BaseState? profileState, BaseState? logoutState}) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
      logoutState: logoutState ?? this.logoutState,
    );
  }
}

sealed class ProfileAction {}

class GetProfile extends ProfileAction {}

class Logout extends ProfileAction {}
