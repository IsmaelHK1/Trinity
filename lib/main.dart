import 'package:flutter/material.dart';

void main() {
  var _controller = TextEditingController();
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 8, 8),
        appBar: AppBar(
          title: const Text('TINITRY'),
          centerTitle: true,
        ),
        
        body: Center(
         child:
         Container(
      margin: EdgeInsets.all(120),
      padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
            color: Colors.red,// set border color
            width: 3.0),   // set border width
        borderRadius: BorderRadius.all(
            Radius.circular(10.0)), // set rounded corner radius
      ),
          child: TextField(
  controller: _controller,
  decoration: InputDecoration(
    hintText: 'Enter a message',
    suffixIcon: IconButton(
      onPressed: _controller.clear,
      icon: Icon(Icons.clear),

  ),
      border: InputBorder.none
    //({BorderSide(color: Colors.red}),
    ),
    ),
  ),

),
           

          ),
  
  ));
}