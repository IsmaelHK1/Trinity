// ignore_for_file: non_constant_identifier_names, file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:trinity/Common/models/UserData.dart';

class FireStoreDatabase {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> CreateUser(UserData user) async {
    bool returnValue = false;

    try {
      await _fireStore.collection("users").doc(user.uid).set({
        'pseudo': user.pseudo,
        'email': user.email,
        'birthdate': user.birthday,
        'about': user.about,
        'accountCreated': Timestamp.now(),
        'role': user.role,
      });
      returnValue = true;
      if (returnValue == true) {}
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }
}
