import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'entity.dart';

class MovieEntity {
  String id;
  String title;
//  String Categories;
  String typeMovie;
  String year;
  String description;
//  String Country;
  String time;
  String trailer;
  List<ImageEntity> screenshots;
  ImageEntity screenshot;
//  DateTime Created;
//  DateTime Modified;

  MovieEntity(
      {this.id,
      this.title = '',
      this.year,
      this.description,
      this.time,
      this.trailer,
      this.typeMovie,
      this.screenshot});

  MovieEntity.fromSnapshotJson(DocumentSnapshot snapshot)
      : this.id = snapshot.documentID,
        this.title = snapshot.data["Title"],
        this.trailer = snapshot.data["Trailer"],
        this.description = snapshot.data["Description"],
        this.typeMovie = snapshot.data["TypeMovie"],
        this.time = snapshot.data["Time"],
        this.year = snapshot.data["Year"],
//    this.Country = snapshot.data["Country"],
        this.screenshot = ImageEntity.fromMap(snapshot.data['Screenshot']);
//    this.screenshots = snapshot.data["Screenshots"]
//      .map<ImageEntity>((item) {
//    return ImageEntity.fromMap(item);
//  }).toList();
//  this.Created = snapshot.data['Created'].toDate(),
//  this.Modified = snapshot.data['Modified'].toDate();

  static Map<String, dynamic> stringToMap(String s) {
    Map<String, dynamic> map = json.decode(s);
    return map;
  }

  toJson() {
    return {
      "id": this.id,
      "Title": this.title,
      "Time": this.time,
      "Trailer": this.trailer,
      "Description": this.description,
      "Year": this.year,
      "TypeMovie": this.typeMovie,
      'Screenshot':
          this.screenshot == null ? ImageEntity() : this.screenshot.toJson(),
//      "Country" : this.Country,
//      "ScreenShots" : this.screenshots == null ? List<ImageEntity> () :
//      this.screenshots.map((i) => i.toJson()).toList(),
//      "Created" : this.Created == null ? DateTime.now() : this.Created,
//      "Modified" : this.Modified == null ? DateTime.now() : this.Modified,
    };
  }
}
