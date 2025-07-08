import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/utils/routes/route_name.dart';

import '../../../features/auth/presentation/view/screens/login_screen.dart';
import '../../../features/auth/presentation/view/screens/signup_screen.dart';
import '../../../features/home/presentation/view/home_screen.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return _handelMaterialPageRoute(
          widget: LoginScreen(),
          settings: settings,
        );
      case RouteName.signUpScreen:
        return _handelMaterialPageRoute(
          widget: SignupScreen(),
          settings: settings,
        );
      case RouteName.homeScreen:
        return _handelMaterialPageRoute(
          widget: HomeScreen(),
          settings: settings,
        );
      default:
        return _handelMaterialPageRoute(
          widget: const Scaffold(body: Center(child: Text('No route defined'))),
          settings: settings,
        );
    }
  }

  static MaterialPageRoute<dynamic> _handelMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
