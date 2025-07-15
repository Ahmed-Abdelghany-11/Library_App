import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:library_app/core/utils/validators/validator.dart';
import 'package:library_app/features/auth/presentation/view_model/signin/signin_state.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/networking/api_result.dart';
import '../../../domain/entity/signin_request_entity.dart';
import '../../../domain/usecase/signin_use_case.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  final SigninUseCase _signinUseCase;
  final Validator validator;
  SigninCubit(this._signinUseCase, this.validator)
    : super(SigninState(signinState: BaseInitialState()));

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  Future<void> _signin() async {
    if (formKey.currentState?.validate() ?? false) {
      emit(state.copyWith(signinState: BaseLoadingState()));
      final result = await _signinUseCase.call(
        SigninRequestEntity(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      switch (result) {
        case SuccessResult<void>():
          emit(state.copyWith(signinState: BaseSuccessState()));
        case FailureResult<void>():
          emit(
            state.copyWith(
              signinState: BaseErrorState(
                errorMessage: result.exception.toString(),
              ),
            ),
          );
      }
    }
  }

  void doIntent(SigninAction action) {
    switch (action) {
      case Signin():
        _signin();
    }
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
