import 'package:byskopoyako/entity/entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MovieService {
  static final String baseUrl = 'movie';

  final CollectionReference _db;

  MovieService() : _db = Firestore.instance.collection(baseUrl);

  Future<MovieEntity> save(MovieEntity entity) async {
    if (entity.id == null) entity.id = _db.document().documentID;

    await _db.document(entity.id).setData(entity.toJson());
    return entity;
  }

  Future<List<MovieEntity>> getByTypeAll(String type) async {
    final CollectionReference _dbs = Firestore.instance.collection(baseUrl);

    QuerySnapshot query =
        await _dbs.where("TypeMovie", isEqualTo: type).getDocuments();
    List<MovieEntity> products = query.documents
        .map((doc) => MovieEntity.fromSnapshotJson(doc))
        .toList();
    return products;
  }
}
