class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }

    type = json['type'];
    identifier = json['identifier'];
  }

  static List<IndustryIdentifiers>? listFromJson(List<dynamic>? list) {
    if (list == null) {
      return null;
    }

    return list.map((element) {
      return IndustryIdentifiers(
        type: element['type'],
        identifier: element['identifier'],
      );
    }).toList();
  }

  @override
  bool operator ==(Object other) {
    return super.hashCode == other.hashCode;
  }

  @override
  int get hashCode {
    return type.hashCode + identifier.hashCode;
  }
}
