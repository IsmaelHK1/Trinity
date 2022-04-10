import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Services/CurrentUser.dart';
import 'package:trinity/Screens/LogInPage/LogInScreen.dart';
import 'package:trinity/Screens/MenuPage/Home_Page.dart';

// Défini deux états d'auth possible via une liste d'enum
enum AuthStatus {
  notLoggedIn,
  loggedIn,
}

class IsLogged extends StatefulWidget {
  const IsLogged({Key? key}) : super(key: key);

  @override
  State<IsLogged> createState() => _IsLoggedState();
}

class _IsLoggedState extends State<IsLogged> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  // Permet de remanier le status lors d'un changement d'état.
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    bool _returnBool = await _currentUser.onAppStart();
    if (_returnBool == true) {
      setState(
        () {
          _authStatus = AuthStatus.loggedIn;
        },
      );
    }
  }

  // Permet de vérifier l'état du User
  @override
  Widget build(BuildContext context) {
    Widget returnValue;
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
        returnValue = const LogInScreen();
        break;
      case AuthStatus.loggedIn:
        returnValue = const MyHomePage();
        break;
    }
    return returnValue;
  }
}
