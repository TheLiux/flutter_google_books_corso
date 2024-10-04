import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final String errorMessage;

  const ErrorText({super.key, this.errorMessage = 'Si è verificato un errore!'});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style: TextStyle(
        color: Colors.red[900],
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
