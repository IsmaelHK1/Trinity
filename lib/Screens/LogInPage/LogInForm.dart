import 'package:flutter/material.dart';
import 'package:trinity/Screens/SignUpPage/SignUpScreen.dart';
import 'package:trinity/common/utils/BordersDesign.dart';
import 'package:trinity/widgets/AuthContainer.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LogInForm> {
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
          TextButton(
            child: const Text(
              "No account ? Just Sign up here!",
              style: TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
