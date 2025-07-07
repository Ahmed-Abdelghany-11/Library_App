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

class Signup extends SignupAction {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  Signup({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });
}
