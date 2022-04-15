// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Screens/ProfilePage/profile_page.dart';
import 'package:trinity/Services/Auth.dart';
import 'package:trinity/Common/utils/IsLogged.dart';
import 'package:trinity/Screens/MenuPage/second.dart';

import '../../Widgets/PartyContainer.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const appName = 'Bienvenue sur Trinity';

    return MaterialApp(
        title: appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Lemon tea',
          textTheme: const TextTheme(
              headline6:
                  TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void signOut(BuildContext context) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
  bool _returnString = await _currentUser.SignOut();

  if (_returnString == true) {
    // Envoie à la page et supprime toutes clear les anciennes routes
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const IsLogged()),
        (route) => false);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(24, 24, 25, 1.0),
      appBar: AppBar(
        title: const Text('MENU'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            // Log out
            icon: const Icon(Icons.logout),
            onPressed: () async {
              signOut(context);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          /* BUTTON ACCOUNT */
          Positioned(
            top: 140,
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                }, //Change de page
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PartyPage()),
                  );
                }, //Change de page
                child: const Icon(
                  Icons.play_circle_fill,
                  size: 50.0,
                ),
              ),
            ),
          ),

          /* Button Add User */
          Positioned(
            bottom: 140,
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                }, //Change de page
                child: const Icon(
                  Icons.person_add_alt_1_sharp,
                  size: 50.0,
                ),
              ),
            ),
          ),

          /* Button notification */
          Positioned(
            bottom: 140,
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
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                }, //Change de page
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
            )),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondPage()),
                );
              }, //Change de page
            ),
          ))
        ],
      ),
    );
  }
}
