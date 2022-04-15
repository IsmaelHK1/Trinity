import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Services/FirestoreDatabase.dart';

// Partie BDD servant à récupérer les données utilisateurs : Status = Ne fonctionne pas

class PartyService {
  final String? uid;

  PartyService(this.uid);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  UserData _userFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      pseudo: snapshot.get('pseudo'),
    );
  }

  Stream<UserData> get user {
    return userCollection.doc(uid).snapshots().map(_userFromSnapshot);
  }
}
