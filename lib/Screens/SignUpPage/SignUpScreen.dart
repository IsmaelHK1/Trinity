import 'package:flutter/material.dart';
import 'package:trinity/Screens/SignUpPage/SignUpForm.dart';
import 'package:trinity/widgets/AuthContainer.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: const Text(
          'Welcome to Trinity',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lemon Tea',
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(24, 24, 25, 1.0),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 100.0),
                children: const <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  SignUpForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
