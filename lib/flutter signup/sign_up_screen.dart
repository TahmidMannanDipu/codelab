import 'package:codelab/flutter%20signup/animation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  double _formProgress = 0;

  void _updateFormProgress() {
    double progress = 0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _userNameTextController
    ];
    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }
    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed(
      '/welcome',
      arguments: _firstNameTextController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        onChanged: _updateFormProgress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress),
            Text(
              'SignUp',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            _buildTextFormField(_firstNameTextController, 'First Name'),
            _buildTextFormField(_lastNameTextController, 'Last Name'),
            _buildTextFormField(_userNameTextController, 'User Name'),
            TextButton(
              onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  return states.contains(WidgetState.disabled)
                      ? null
                      : Colors.white;
                }),
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  return states.contains(WidgetState.disabled)
                      ? null
                      : Colors.blue;
                }),
              ),
              child: const Text("Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTextFormField(_controller, String labelText) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: _controller,
      decoration: InputDecoration(
        labelText: labelText,
      ),
    ),
  );
}
