import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import 'app_data.dart';
import 'app_methods.dart';
import 'app_tools.dart';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> createUserAccount(
      {String fullName, String phone, String email, String password}) async {
    FirebaseUser user;

    try {
//      user = await auth.createUserWithEmailAndPassword(
//        email: email,
//        password: password,
//      );

      user = (await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      )) as FirebaseUser;

      if (user != null) {
        await firestore.collection(userData).document(user.uid).setData({
          userID: user.uid,
          accountName: fullName,
          userEmail: email,
          userPassword: password,
          phoneNumber: phone
        });

        writeDataLocally(key: userID, value: user.uid);
        writeDataLocally(key: accountName, value: fullName);
        writeDataLocally(key: phoneNumber, value: phone);
        writeDataLocally(key: userEmail, value: email);
        writeDataLocally(key: userPassword, value: password);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return errorMSG(e.details);
    }

    return user == null ? errorMSG("Error") : successfulMSG();
  }

  @override
  Future<String> loginUser({String email, String password}) async {
    FirebaseUser user;
    try {
//      user = await auth.signInWithEmailAndPassword(
//        email: email,
//        password: password,
//      );

      user = (await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      )) as FirebaseUser;

      if (user != null) {
        DocumentSnapshot userInfo = await getUserInfo(user.uid);
        await writeDataLocally(key: userID, value: userInfo[userID]);
        await writeDataLocally(key: accountName, value: userInfo[accountName]);
        await writeDataLocally(key: userEmail, value: userInfo[userEmail]);
        await writeDataLocally(key: phoneNumber, value: userInfo[phoneNumber]);
        await writeDataLocally(key: photoUrl, value: userInfo[photoUrl]);
        await writeBoolDataLocally(key: loggedIn, value: true);

        print(userInfo[userEmail]);
      }
    } on PlatformException catch (e) {
      print(e.details);
      return errorMSG(e.details);
    }

//   showSnackBar(message, scaffoldKey);
    return user == null ? errorMSG("Error") : successfulMSG();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> successfulMSG() async {
    return successful;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  @override
  Future<bool> logOutUser() async {
    await auth.signOut();
    await clearDataLocally();

    return complete();
  }

  @override
  Future<DocumentSnapshot> getUserInfo(String userId) async {
    return await firestore.collection(userData).document(userId).get();
  }
}
