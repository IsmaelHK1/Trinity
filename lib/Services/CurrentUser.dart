import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CurrentUser extends ChangeNotifier {
  late String userUid;
  late String userEmail;

  // Accessor
  String get getUid => userUid;
  String get getEmail => userEmail;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Permet l'inscription de l'utilisateur
  Future<bool> signUpUser(String email, String password) async {
    bool returnValue = false;

    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

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
      User _firebaseUser = await _auth.currentUser!;
      userUid = _firebaseUser.uid;
      userEmail = _firebaseUser.email!;
      returnValue = true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return returnValue;
  }

  // Permet à l'utilisateur de se déconnecter de sa session
  Future<bool> SignOut() async {
    bool returnValue = false;
    try {
      await _auth.signOut();
      userUid = '';
      userEmail = '';
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
        userUid = _authResult.user!.uid;
        userEmail = _authResult.user!.email!;
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
