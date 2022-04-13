import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Services/FirestoreDatabase.dart';

class PartyService {
  final String? uid;

  PartyService(this.uid);

  final CollectionReference consumptionCollection =
      FirebaseFirestore.instance.collection("consumption");

  Future<void> addConsumption(int soft, int medium, int hard) async {
    return await consumptionCollection.doc(uid).set({
      'soft' : soft,
      'medium' : medium,
      'hard' : hard,
    });
  }
}