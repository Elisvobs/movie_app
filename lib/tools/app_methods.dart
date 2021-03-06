import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AppMethods {
  Future<String> loginUser({
    String email,
    String password,
  });

  Future<String> createUserAccount({
    String fullName,
    String phone,
    String email,
    String password,
  });

  Future<bool> logOutUser();

  Future<DocumentSnapshot> getUserInfo(String userId);
}
