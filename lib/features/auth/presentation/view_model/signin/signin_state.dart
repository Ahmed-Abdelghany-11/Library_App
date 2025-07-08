import 'package:equatable/equatable.dart';

import '../../../../../core/base/base_state.dart';

class SigninState extends Equatable {
  final BaseState signinState;

  const SigninState({required this.signinState});

  @override
  List<Object?> get props => [signinState];

  SigninState copyWith({BaseState? signinState}) {
    return SigninState(signinState: signinState ?? this.signinState);
  }
}

sealed class SigninAction {}

class Signin extends SigninAction {}
