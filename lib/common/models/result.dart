import 'package:flutter_google_books/common/models/items.dart';

class Result {
  int? totalItems;
  List<Items>? items;

  Result({this.totalItems, this.items});

  Result.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['totalItems'] = totalItems;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
