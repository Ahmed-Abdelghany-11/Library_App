import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/assets/app_colors.dart';

import '../../../../../core/base/base_state.dart';
import '../../../../../core/utils/di/di.dart';
import '../../../../../core/utils/routes/route_name.dart';
import '../../view_model/signin/signin_cubit.dart';
import '../../view_model/signin/signin_state.dart';
import '../widgets/login/donot_have_account.dart';
import '../widgets/login/signin_form.dart';
import '../widgets/login/signin_header.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final viewModel = getIt<SigninCubit>();

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
                  const SigninHeader(),
                  const SizedBox(height: 20),
                  BlocListener<SigninCubit, SigninState>(
                    listener: (context, state) {
                      if (state.signinState is BaseSuccessState) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.homeScreen,
                        );
                      } else if (state.signinState is BaseErrorState) {
                        Navigator.of(context, rootNavigator: true).maybePop();
                        final errorMessage =
                            (state.signinState as BaseErrorState).errorMessage;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(errorMessage),
                            backgroundColor: AppColors.red,
                          ),
                        );
                      } else if (state.signinState is BaseLoadingState) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) =>
                              const Center(child: CircularProgressIndicator()),
                        );
                      }
                    },
                    child: SigninForm(),
                  ),
                  const SizedBox(height: 20),
                  const DonotHaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
