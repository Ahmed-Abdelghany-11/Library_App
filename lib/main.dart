import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/core/utils/routes/app_routes.dart';
import 'package:library_app/core/utils/routes/route_name.dart';
import 'package:logger/logger.dart';

import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/di/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Bloc.observer = BlocObserverService(getIt<Logger>());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: RouteName.loginScreen,
    );
  }
}
