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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(child: Text("Trinity")),
        ),
        body: Image.asset(
          'images/logo_trinity.png',
          width: 200,
          height: 200,
          fit: BoxFit.contain,
          alignment: ,
        ),
      ),
    );
  }
}
