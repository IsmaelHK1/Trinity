import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trinity/postgame_Page.dart';

class GetUser extends StatefulWidget {
  const GetUser({Key? key}) :super(key: key);

  @override
  _GetUserState createState() => _GetUserState();
}
GlobalMethods _globalMethods = GlobalMethods();

class GlobalMethods {}
}
class _GetUserState extends State<GetUser> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Actions(actions: , child: Column(
      children: <Widget>[firebaseAuthContainer(context, "Ajouter", () {
        FirebaseAuth.instance
            .signInWithPopup()
            .then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PostGame_page()));
        }).onError((error, stackTrace) {
          string Error_message = "Error ${error.toString()}";
          _globalMethos;
        } )
      })],
    ))
    throw UnimplementedError();
  }

  firebaseAuthContainer(BuildContext context, String s, Null Function() param2) {}
}

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 37, 24, 150),
        body: Center(
          child: PostGame_page(),
        ),
      ),
    );
  }
}