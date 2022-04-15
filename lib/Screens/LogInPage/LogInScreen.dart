import 'package:flutter/material.dart';
import 'package:trinity/Screens/LoginPage/LoginForm.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset(
                    'assets/images/logo_trinity_nobg.png',
                    width: 180.0,
                    height: 180.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const LogInForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
