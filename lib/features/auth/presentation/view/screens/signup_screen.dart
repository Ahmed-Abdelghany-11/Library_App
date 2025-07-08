import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/base/base_state.dart';
import 'package:library_app/core/utils/di/di.dart';
import '../../../../../core/utils/routes/route_name.dart';
import '../../view_model/signup/signup_cubit.dart';
import '../../view_model/signup/signup_state.dart';
import '../widgets/signup/already_have_account.dart';
import '../widgets/signup/signup_form.dart';
import '../widgets/signup/signup_header.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final viewModel = getIt<SignupCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SignupHeader(),
                  const SizedBox(height: 20),
                  BlocListener<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state.signupState is BaseSuccessState) {
                        Navigator.of(context, rootNavigator: true).maybePop();
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.loginScreen,
                        );
                      } else if (state.signupState is BaseErrorState) {
                        Navigator.of(context, rootNavigator: true).maybePop();
                        final errorMessage =
                            (state.signupState as BaseErrorState).errorMessage;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(errorMessage)));
                      } else if (state.signupState is BaseLoadingState) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                    child: SignupForm(),
                  ),
                  const SizedBox(height: 20),
                  const AlreadyHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
