class ImageEntity {
  ImageEntity({this.url = ''});
  String url;

  ImageEntity.fromMap(Map<dynamic, dynamic> data) : url = data["url"];

  toJson() {
    return {"url": this.url};
  }
}
