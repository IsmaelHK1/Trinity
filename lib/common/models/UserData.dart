import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String imagePath;
  final String pseudo;
  final String email;
  final String age;
  final String about;

  const User({
    required this.imagePath,
    required this.pseudo,
    required this.email,
    required this.about,
    required this.age,
  });
}
