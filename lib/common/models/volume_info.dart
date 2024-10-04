import 'package:flutter_google_books/common/models/image_links.dart';
import 'package:flutter_google_books/common/models/industry_identifiers.dart';

class VolumeInfo {
  String? title;
  List<String>? authors;
  ImageLinks? imageLinks;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  List<IndustryIdentifiers>? industryIdentifiers;

  VolumeInfo({
    this.title,
    this.authors,
    this.imageLinks,
    this.publisher,
    this.publishedDate,
    this.description,
    this.pageCount,
  });

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    imageLinks = ImageLinks.fromJson(json['imageLinks']);
    authors =listFromJson(json['authors']);
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    pageCount = json['pageCount'];
    industryIdentifiers = IndustryIdentifiers.listFromJson(json["industryIdentifiers"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['authors'] = authors;
    data['imageLinks']= imageLinks;
    data['publisher'] = publisher;
    data['publishedDate'] = publishedDate;
    data['description'] = description;
    data['pageCount'] = pageCount;
    return data;
  }

  List<String>? listFromJson(List<dynamic>? list) {
    if (list == null) {
      return null;
    }

    return list.map((element) => element.toString()).toList();
  }

  String authorsToString() {
    if (authors == null || authors!.isEmpty) {
      return 'Anonimo';
    }

    return authors!.fold('', (prev, curr) {
      if (prev.isEmpty) {
        return curr;
      }

      return '$prev $curr';
    });
  }
}
