import 'package:flutter_google_books/common/models/industry_identifiers.dart';

extension ListExtensions on List? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension ListX on List<IndustryIdentifiers> {
  int get hashList {
    final hash = fold(0, (prev, curr) => prev + curr.hashCode);

    return hash;
  }
}
