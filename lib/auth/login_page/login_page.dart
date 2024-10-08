import 'package:flutter/material.dart';
import 'package:flutter_google_books/auth/login_page/firebase/authentication.dart';
import 'package:flutter_google_books/auth/login_page/validators/email_validator.dart';
import 'package:flutter_google_books/auth/login_page/validators/password_validator.dart';
import 'package:flutter_google_books/auth/login_page/widgets/login_button.dart';
import 'package:flutter_google_books/common/widgets/error_snack_bar.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _inputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
  );

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authentication = Authentication();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (email) => emailValidator(email),
                      decoration: _inputDecoration.copyWith(
                        label: const Text("Email"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      autovalidateMode: AutovalidateMode.always,
                      validator: (password) => passwordValidator(password),
                      decoration: _inputDecoration.copyWith(
                        label: const Text("Password"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    LoginButton(
                      signIn: () => _signIn(context),
                      isLoading: _isLoading,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = !_isLoading);

      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      try {
        await _authentication.signIn(email, password);
        if (context.mounted) {
          context.pushReplacementNamed('/home');
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(errorSnackbar());
        }
      }

      setState(() => _isLoading = !_isLoading);
    }
  }
}
