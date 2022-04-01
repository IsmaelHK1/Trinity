import 'dart:io';

import 'package:flutter/material.dart';

//---------------------------------------------------------------------
//---------------Widget test----------------
//---------------------------------------------------------------------
class SecondPage extends StatelessWidget {

  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text('HELLO WORLD'),
      )
    );
  }
}