import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Screens/MenuPage/Home_Page.dart';
import 'package:trinity/Services/Auth.dart';
import 'package:trinity/Services/Party.dart';

import '../Services/UserPseudo.dart';

void main() {
  runApp(const MyPage());
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Permet d'écouter un changement
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Projet Trinity',
        home: PartyPage(),
      ),
    );
  }
}

class PartyPage extends StatefulWidget {
  const PartyPage({Key? key}) : super(key: key);

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  final int _maxLifePoint = 120;
  late int _lifePoint = _maxLifePoint;
  double _percentLifePoint = 1;
  final List<String> _historicConsumption = <String>[];

  void _addConsumption(int damage) {
    setState(() {
      _lifePoint -= damage;
      _percentLifePoint = _lifePoint * 100 / _maxLifePoint / 100;

      switch(damage) {
        case 5:
          _historicConsumption.add("Soft: -" + damage.toString() + " PV");
          break;
        case 10:
          _historicConsumption.add("Medium: -" + damage.toString() + " PV");
          break;
        case 20:
          _historicConsumption.add("Hard: -" + damage.toString() + " PV");
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return /*StreamProvider<UserData>.value(
        initialData: UserData(),
        value: PartyService(CurrentUser().getCurrentUser?.uid).user,
        child: */
      Scaffold(
        appBar: AppBar(
          title: const Text(
            "Party",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Lemon Tea',
            ),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        backgroundColor: const Color.fromRGBO(24, 24, 25, 1.0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // const UserPseudo(),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                'Shadowolf',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lemon Tea',
                  fontSize: 28.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Tank',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Lemon Tea',
                  fontSize: 21.0,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              SizedBox(
                width: 300,
                height: 20,
                child: Stack(
                  children: [
                    SizedBox.expand(
                      child: LinearProgressIndicator(
                        value: _percentLifePoint,
                        backgroundColor: Colors.red,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Center(
                      child: Text(
                        _lifePoint.toString() + " PV",
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Lemon Tea',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => _addConsumption(5),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Soft',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lemon Tea',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  TextButton(
                    onPressed: () => _addConsumption(10),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Medium',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lemon Tea',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  TextButton(
                    onPressed: () => _addConsumption(20),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Hard',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lemon Tea',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              for (int i = 0; i < _historicConsumption.length; i++)
                Text(
                  _historicConsumption[i],
                  style: const TextStyle(
                    color: Colors.red,
                    fontFamily: 'Lemon Tea',
                  ),
                ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () => MaterialPageRoute(builder: (context) => const MyHomePage()),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Fin de soirée',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Lemon Tea',
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}