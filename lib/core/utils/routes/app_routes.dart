import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app/core/utils/routes/route_name.dart';

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return _handelMaterialPageRoute(
          widget: Placeholder(),
          settings: settings,
        );
      case RouteName.signUpScreen:
        return _handelMaterialPageRoute(
          widget: Placeholder(),
          settings: settings,
        );
      case RouteName.homeScreen:
        return _handelMaterialPageRoute(
          widget: Placeholder(),
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
