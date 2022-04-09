// ignore: file_names
import 'package:flutter/material.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Center(
          child: Text(
            "Trinity",
            style: TextStyle(
              color: Color.fromARGB(255, 119, 208, 240),
            ),
          ),
        ),
      ),
      body: Center(
        child: Image.asset(
          'images/logo_trinity.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
