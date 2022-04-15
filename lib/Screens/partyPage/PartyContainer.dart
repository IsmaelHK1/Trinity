import 'package:flutter/material.dart';
import 'package:trinity/Screens/MenuPage/Home_Page.dart';

class PartyPage extends StatefulWidget {
  const PartyPage({Key? key}) : super(key: key);

  @override
  State<PartyPage> createState() => _PartyPageState();
}

class _PartyPageState extends State<PartyPage> {
  final int _maxLifePoint = 100;
  late int _lifePoint = _maxLifePoint;
  double _percentLifePoint = 1;
  final List<String> _historicConsumption = <String>[];

  void _addConsumption(int damage) {
    setState(() {
      _lifePoint -= damage;
      _percentLifePoint = _lifePoint * 100 / _maxLifePoint / 100;

      if (_lifePoint <= 20 && _lifePoint > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Care, you are about to be out of health !',
              style: TextStyle(color: Colors.red),
            ),
            duration: Duration(seconds: 1),
          ),
        );
      }

      if (_lifePoint <= 0) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            (route) => false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'END of the game ! You are out of health, take a rest now !',
              style: TextStyle(color: Colors.red),
            ),
            duration: Duration(seconds: 2),
          ),
        );
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
              'kierhann',
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
              'DPS',
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
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
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
