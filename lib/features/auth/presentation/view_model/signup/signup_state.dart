import 'package:equatable/equatable.dart';

import '../../../../../core/base/base_state.dart';

class SignupState extends Equatable {
  final BaseState signupState;
  const SignupState({required this.signupState});

  @override
  List<Object?> get props => [signupState];

  SignupState copyWith({BaseState? signupState}) {
    return SignupState(signupState: signupState ?? this.signupState);
  }
}

sealed class SignupAction {}

class Signup extends SignupAction {}
