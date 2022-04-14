import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Services/Party.dart';

import '../Services/UserPseudo.dart';

// void main() {
//   runApp(const MyPage());
// }
//
// class MyPage extends StatelessWidget {
//   const MyPage({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.yellow,
//       ),
//       home: const PartyPage(),
//     );
//   }
// }

class PartyPage extends StatefulWidget {
  const PartyPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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


    return StreamProvider<UserData>.value(
        initialData: UserData(),
        value: PartyService(UserData().uid).user,
        child: Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Soirée"),
      ),
      body: Center(
        child: Column(
          children: [
            // Text(
            //
            //   style: TextStyle(fontSize: 28),
            // ),
            const UserPseudo(),
            const Text(
              'Tank',
              style: TextStyle(fontSize: 21),
            ),
            SizedBox(
              width: 300,
              height: 20,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: LinearProgressIndicator(
                      value: _percentLifePoint,
                      backgroundColor: Colors.cyan[100],
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  ),
                  Center(
                    child: Text(
                      _lifePoint.toString() + "PV",
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _addConsumption(5),
                  child: const Text('Soft'),
                ),
                TextButton(
                  onPressed: () => _addConsumption(10),
                  child: const Text('Medium'),
                ),
                TextButton(
                  onPressed: () => _addConsumption(20),
                  child: const Text('Hard'),
                ),
              ],
            ),
            for (int i = 0; i < _historicConsumption.length; i++)
              Text(_historicConsumption[i]),
            const TextButton(
              onPressed: null,
              child: Text('Fin de soirée'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}