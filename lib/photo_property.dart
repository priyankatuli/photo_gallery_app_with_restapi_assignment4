class PhotoProperty {

  int ? albumId;
   int ? id;
   String ? title;
   String ? url;
  String ? thumbnailUrl;

  PhotoProperty(
      {required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  factory PhotoProperty.fromJson(Map<String, dynamic> json) => PhotoProperty(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );


}

