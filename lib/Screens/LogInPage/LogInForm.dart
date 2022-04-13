// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Screens/classChoiceScreen.dart/classChoiceScreen.dart';
import 'package:trinity/Services/Auth.dart';
import 'package:trinity/Common/utils/IsLogged.dart';
import 'package:trinity/Screens/SignUpPage/SignUpScreen.dart';
import 'package:trinity/common/utils/BordersDesign.dart';
import 'package:trinity/widgets/AuthContainer.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LogInForm> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // ignore: non_constant_identifier_names
  void _LogInUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.LogInUser(email, password)) {
        // pushAndRemoveUntil permet d'éviter d'avoir cette flèche sur l'appbar lors de la connexion en vidant les routes
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const IsLogged()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Incorrect Login info !',
              style: TextStyle(color: Colors.red),
            ),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20.0),
            child: Text(
              "Log In",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'Lemon Tea',
                  fontSize: 20.0),
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.alternate_email),
                hintText: 'Email'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.password), hintText: 'Password'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 100.0,
              ),
              child: Text(
                "Enter",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lemon Tea',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                ),
              ),
            ),
            onPressed: () {
              _LogInUser(
                  emailController.text, passwordController.text, context);
            },
          ),
          TextButton(
            child: const Text(
              "No account ? Just Sign up here!",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ClassChoiceScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
