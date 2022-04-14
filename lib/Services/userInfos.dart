/*import 'package:flutter/foundation.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<UserData> getUser(String uid) async {
  UserData userVal;
  final FirebaseFirestore _fireuser = FirebaseFirestore.instance;

  try {
    DocumentSnapshot _docSnapshot =
        await _fireuser.collection("users").doc(uid).get();
    userVal = UserData.fromDocumentSnapshot(doc: _docSnapshot);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }

  return userVal;
}
*/