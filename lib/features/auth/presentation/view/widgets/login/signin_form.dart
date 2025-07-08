import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/shared/custom_text_form_field.dart';
import '../../../view_model/signin/signin_cubit.dart';
import '../../../view_model/signin/signin_state.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SigninCubit>();
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: viewModel.emailController,
            label: 'Email',
            validator: (value) =>
                viewModel.validator.validateEmail(value ?? ''),
          ),
          CustomTextFormField(
            controller: viewModel.passwordController,
            label: 'Password',
            obscureText: true,
            validator: (value) =>
                viewModel.validator.validatePassword(value ?? ''),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                viewModel.doIntent(Signin());
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
