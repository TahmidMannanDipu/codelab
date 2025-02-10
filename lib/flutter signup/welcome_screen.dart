import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final firstName =
        ModalRoute.of(context)?.settings.arguments as String? ?? 'User';
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome $firstName',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
