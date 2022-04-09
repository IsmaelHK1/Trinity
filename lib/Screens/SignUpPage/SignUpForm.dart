import 'package:flutter/material.dart';
import 'package:trinity/common/utils/BordersDesign.dart';
import 'package:trinity/widgets/AuthContainer.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
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
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.person), hintText: 'Pseudo'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.alternate_email),
                hintText: 'Email'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.password), hintText: 'Password'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
            decoration: textInputDecoration.copyWith(
                prefixIcon: const Icon(Icons.edit_calendar),
                hintText: 'Birthdate'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          TextFormField(
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
