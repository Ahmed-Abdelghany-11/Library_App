import 'package:flutter/material.dart';

class MyLibraryScreen extends StatelessWidget {
  const MyLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to My Library',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
