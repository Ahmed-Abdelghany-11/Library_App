import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/shared/custom_text_form_field.dart';
import '../../../view_model/signup/signup_cubit.dart';
import '../../../view_model/signup/signup_state.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignupCubit>();
    return Form(
      key: viewModel.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: viewModel.firstNameController,
            label: 'First Name',
            validator: (value) => viewModel.validator.validateName(value ?? ''),
          ),
          CustomTextFormField(
            controller: viewModel.lastNameController,
            label: 'Last Name',
            validator: (value) => viewModel.validator.validateName(value ?? ''),
          ),
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
          CustomTextFormField(
            controller: viewModel.confirmPasswordController,
            label: 'Confirm Password',
            obscureText: true,
            validator: (value) => viewModel.validator.validateConfirmPassword(
              value ?? '',
              viewModel.passwordController.text,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                viewModel.doIntent(Signup());
              },
              child: const Text('Sign Up'),
            ),
          ),
        ],
      ),
    );
  }
}
