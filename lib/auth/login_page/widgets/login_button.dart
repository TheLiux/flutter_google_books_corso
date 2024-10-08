import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback signIn;
  final bool isLoading;

  const LoginButton({
    super.key,
    required this.signIn,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !isLoading,
      replacement: const CircularProgressIndicator(),
      child: ElevatedButton(
        onPressed: () => signIn(),
        child: const Text("Login"),
      ),
    );
  }
}
