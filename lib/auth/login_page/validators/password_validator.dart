import 'package:flutter_google_books/common/extensions/string.dart';

String? passwordValidator(String? password) {
  if (password.isNullOrEmpty) {
    return "Inserisci una password";
  }

  if (password!.length < 6) {
    return "La password deve avere almeno 6 caratteri";
  }

  return null;
}
