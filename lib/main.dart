import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projet Trinity',
      home: Scaffold(
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
        body: Container(
          child: Center(
            child: Image.asset(
              'images/logo_trinity.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
