import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/networking/api_result.dart';
import 'package:library_app/core/utils/validators/validator.dart';
import 'package:library_app/features/auth/domain/entity/signup_request_entity.dart';
import 'package:library_app/features/auth/presentation/view_model/signup/signup_state.dart';

import '../../../domain/usecase/signup_use_case.dart';

@injectable
class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase _signupUseCase;
  final Validator validator;
  SignupCubit(this._signupUseCase, this.validator)
    : super(SignupState(signupState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> _signup() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(signupState: BaseLoadingState()));
      final result = await _signupUseCase.call(
        SignupRequestEntity(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
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
  }

  void doIntent(SignupAction action) {
    switch (action) {
      case Signup():
        _signup();
    }
  }

  @override
  Future<void> close() async {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.close();
  }
}
