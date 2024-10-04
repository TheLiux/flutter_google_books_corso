class ImageLinks {
  String? thumbnail;
  String? smallThumbnail;

  ImageLinks({
    this.thumbnail,
    this.smallThumbnail,
  });

  ImageLinks.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return;
    }

    thumbnail = json['thumbnail'];
    smallThumbnail = json['smallThumbnail'];
  }
}
