extension StringX on String {
  bool get toBoolean => toLowerCase() == 'true';
}


extension StringEx on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}