// ignore_for_file: file_names
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Services/Auth.dart';
import 'package:trinity/Common/utils/checkAge.dart';
import 'package:trinity/common/utils/BordersDesign.dart';
import 'package:trinity/widgets/AuthContainer.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  TextEditingController pseudoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  void _signUpUser(
    String email,
    String password,
    String pseudo,
    String about,
    String birthdate,
    BuildContext context,
  ) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.signUpUser(
          email, password, pseudo, about, birthdate)) {
        Navigator.pop(context);
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
              "Sign In",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'Lemon Tea',
                  fontSize: 20.0),
            ),
          ),
          TextFormField(
            controller: pseudoController,
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.person), hintText: 'Pseudo'),
          ),
          const SizedBox(
            height: 10.0,
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
            height: 10.0,
          ),
          TextFormField(
            controller: ageController,
            keyboardType: TextInputType.number,
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.edit_calendar),
                hintText: 'Birthdate'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            controller: aboutController,
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.text_fields),
                hintText: 'Short description...'),
            minLines: 3,
            maxLines: 6,
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
              if (isAdult(ageController.text) == true) {
                _signUpUser(
                    emailController.text,
                    passwordController.text,
                    pseudoController.text,
                    ageController.text,
                    aboutController.text,
                    context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'You must be at least 18 years old !',
                      style: TextStyle(color: Colors.red),
                    ),
                    duration: Duration(seconds: 3),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
