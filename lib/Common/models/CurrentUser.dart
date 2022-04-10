import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CurrentUser extends ChangeNotifier {
  late String userUid;
  late String userEmail;

  // CurrentState({required this.userUid, required this.userEmail})

  // Accessor
  String get getUid => userUid;
  String get getEmail => userEmail;

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
