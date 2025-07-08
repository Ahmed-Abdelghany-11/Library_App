import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/assets/app_colors.dart';
import '../../../../../../core/utils/routes/route_name.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Already have an account? ',
        style: const TextStyle(color: AppColors.black, fontSize: 16),
        children: [
          TextSpan(
            text: 'Login',
            style: const TextStyle(
              color: AppColors.blue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, RouteName.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
