import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Screens/MenuPage/Home_Page.dart';
import 'package:trinity/Services/Party.dart';

import '../Services/UserPseudo.dart';

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

      if (_lifePoint - damage <= 0) {
        MaterialPageRoute(builder: (context) => const MyHomePage());
      }

      switch (damage) {
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
          title: const Text("Soirée"),
        ),
        body: Center(
          child: Column(
            children: [
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
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.green),
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
