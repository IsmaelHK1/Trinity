// ignore_for_file: non_constant_identifier_names, duplicate_ignore, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Services/firestoreDatabase.dart';

class CurrentUser extends ChangeNotifier {
  UserData? _currentUser;

  UserData? get getCurrentUser => _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Permet l'inscription de l'utilisateur
  Future<bool> signUpUser(String email, String password, String pseudo,
      String age, String role, String about) async {
    bool returnValue = false;
    UserData _localUser = UserData();

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _localUser.uid = _authResult.user!.uid;
      _localUser.pseudo = pseudo;
      _localUser.email = _authResult.user!.email;
      _localUser.birthday = age;
      _localUser.role = role;
      _localUser.about = about;
      bool _isDone = await FireStoreDatabase().CreateUser(_localUser);

      if (_isDone == true) {
        return returnValue = true;
      }

      if (_authResult.user != null) {
        returnValue = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }

  // Permet de vérifier si l'utilisateur s'est déjà connecté ou non
  Future<bool> onAppStart() async {
    bool returnValue = false;
    try {
      User _firebaseUser = _auth.currentUser!;
      _currentUser?.uid = _firebaseUser.uid;
      _currentUser?.uid = _firebaseUser.email;
      returnValue = true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }

  // Permet à l'utilisateur de se déconnecter de sa session
  // ignore: non_constant_identifier_names
  Future<bool> SignOut() async {
    bool returnValue = false;
    try {
      await _auth.signOut();
      _currentUser = UserData();
      returnValue = true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }

  // Permet à l'utilisateur de se connecter
  Future<bool> LogInUser(String email, String password) async {
    bool returnValue = false;

    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      if (_authResult.user != null) {
        _currentUser?.uid = _authResult.user!.uid;
        _currentUser?.email = _authResult.user!.email!;
        returnValue = true;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }
}
