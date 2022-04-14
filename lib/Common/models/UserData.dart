// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? uid;
  String? imagepath;
  String? pseudo;
  String? email;
  String? birthday;
  String? about;
  Timestamp? accountCreated;

  UserData({
    this.uid,
    this.imagepath,
    this.pseudo,
    this.email,
    this.birthday,
    this.about,
    this.accountCreated,
  });

  UserData.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    pseudo = doc['pseudo'];
    email = doc['email'];
    birthday = doc['birthday'];
    about = doc['about'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pseudo': pseudo,
      'email': email,
      'birthday': birthday,
      'about': about,
    };
  }
}
