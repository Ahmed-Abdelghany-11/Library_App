import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/features/auth/domain/entity/user_request_entity.dart';
import 'package:library_app/features/auth/presentation/view_model/signup/signup_state.dart';

import '../../../domain/usecase/signup_use_case.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase _signupUseCase;
  SignupCubit(this._signupUseCase)
    : super(SignupState(signupState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> _signup() async {
    emit(state.copyWith(signupState: BaseLoadingState()));
    final result = await _signupUseCase.call(
      UserRequestEntity(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phoneNumber: phoneNumberController.text,
        password: passwordController.text,
      ),
    );
    switch (result) {
      case SuccessResult<void>():
        emit(state.copyWith(signupState: BaseSuccessState()));
      case FailureResult<void>():
        emit(
          state.copyWith(
            signupState: BaseErrorState(
              errorMessage: result.exception.toString(),
            ),
          ),
        );
    }
  }

  void doIntent(SignupAction action) {
    switch (action) {
      case Signup():
        _signup();
    }
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.close();
  }
}
