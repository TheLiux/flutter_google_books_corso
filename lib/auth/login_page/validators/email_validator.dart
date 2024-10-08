import 'package:flutter_google_books/common/extensions/string.dart';

String? emailValidator(String? email) {
  if (email.isNullOrEmpty) {
    return "Inserisci una mail";
  }

  final bool emailValid =
      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email!);

  if (!emailValid) {
    return "Email non valida";
  }

  return null;
}
