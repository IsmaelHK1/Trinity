import 'package:flutter/material.dart';
import 'package:trinity/second.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appName = 'Bienvenue sur Trinity';

    return MaterialApp(
        title : appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lemon tea',

        textTheme: const TextTheme(
            headline6: TextStyle(fontSize: 30.0 , fontWeight: FontWeight.bold) ),

      ),

      home: const MyHomePage(
        title: appName
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(24,24,25,1.0),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Center(
            child: Material(
              color : const Color(0x00ffffff),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                child: Container(
                  width: 80.0,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                )
              ),
            ),
          );
        }),
      )
    );
  }
}

//class RaisedButton extends StatefulWidget(
//onPressed: null,
//shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
//)

