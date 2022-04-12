// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String? uid;
  String? pseudo;
  String? email;
  String? birthday;
  String? about;
  Timestamp? accountCreated;
  String? role;

  UserData({
    this.uid,
    this.pseudo,
    this.email,
    this.birthday,
    this.about,
    this.accountCreated,
    this.role,
  });
}
