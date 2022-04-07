import 'package:flutter/material.dart';
import 'package:trinity/second.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

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
        body: Stack(
          children: <Widget> [

            /* BUTTON ACCOUNT */
            Positioned(
              top : 140,
              left: 60,
              child : Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                  child: const Icon(
                    Icons.account_circle,
                    size: 50.0,
                  ),
                ),
              ),
            ),

            /* Button play */
            Positioned(
              top: 140,
              right: 60,
              child: Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                  child: const Icon(
                    Icons.play_circle_fill,
                    size: 50.0,
                  ),
                ),
              ),),

            /* Button Add User */
            Positioned(
              bottom : 140,
              right: 60,
              child: Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                  child: const Icon(
                    Icons.person_add_alt_1_sharp,
                    size: 50.0,
                  ),
                ),
              ),),

            /* Button notification */
            Positioned(
              bottom : 140,
              left: 60,
              child: Container(
                alignment: Alignment.center,
                width: 80.0,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                  child: const Icon(
                    Icons.notifications,
                    size: 50.0,
                  ),
                ),
              ),
            ),

            /* logo trinity */
            Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 100,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/logo_trinity.png'),
                      )
                  ),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPage()),);}, //Change de page
                  ),
                ) )
          ],
        )
    );
  }
}