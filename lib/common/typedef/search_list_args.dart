import 'package:flutter_google_books/common/extensions/string.dart';

typedef SearchListArgs = ({String value, bool isCategory});

SearchListArgs searchListArgsFromMap(Map<String, String> map) {
  final value = map['value'] as String;
  final isCategory = map['isCategory'] as String;

  return (value: value, isCategory: isCategory.toBoolean);
}
