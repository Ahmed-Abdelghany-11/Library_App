import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/routes/route_name.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Don\'t have an account? ',
        style: const TextStyle(color: AppColors.black, fontSize: 16),
        children: [
          TextSpan(
            text: 'Sign Up',
            style: const TextStyle(
              color: AppColors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RouteName.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}
