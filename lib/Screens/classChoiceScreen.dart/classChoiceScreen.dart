import 'package:flutter/material.dart';
import 'package:trinity/Screens/LogInPage/LogInForm.dart';
import 'package:trinity/Screens/LogInPage/LogInScreen.dart';
import 'package:trinity/Screens/SignUpPage/SignUpForm.dart';
import 'package:trinity/Screens/SignUpPage/SignUpScreen.dart';
import 'package:trinity/Widgets/roleContainer.dart';

class ClassChoiceScreen extends StatefulWidget {
  const ClassChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ClassChoiceScreen> createState() => _ClassChoiceScreenState();
}

class _ClassChoiceScreenState extends State<ClassChoiceScreen> {
  @override
  String text = 'blablablabla';

  void changeData() {
    setState(() {
      text = 'lalalala';
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0.0,
        title: const Text(
          'Choose your Role',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Lemon Tea',
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(24, 24, 25, 1.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 60.0),
            child: const Expanded(
              child: Text(
                'During inscription, you will have to choose your role. Here you will find a short description of each role. Choose the one who correspond you the more.',
                style: TextStyle(
                  fontFamily: 'Louis george café',
                  fontSize: 20,
                  color: Colors.blueAccent,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/TankIcone.png',
                    width: 120.0,
                    height: 120.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Tank',
                    style: TextStyle(
                        fontFamily: 'Lemon Tea',
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/HealerIcone.png',
                    width: 120.0,
                    height: 120.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Healer',
                    style: TextStyle(
                        fontFamily: 'Lemon Tea',
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/DpsIcone.png',
                    width: 120.0,
                    height: 120.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'DPS',
                    style: TextStyle(
                        fontFamily: 'Lemon Tea',
                        color: Colors.red,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ],
          ),
          const RoleContainer(
            child: Text(
              '- Tank : Choose tank if you are a good drinker. If you qualify as having a good alcohol resistance, and drink a lot, choose this role !\n'
              '- Healer : Choose healer if you don\'t consume alchool or drink just one glass. Your role is the center of our application. You will have as a MMORPG support, to take care about your teammates.\n'
              '- DPS : Choose DPS if you are an average drinker.',
              style: TextStyle(
                fontFamily: 'Louis george café',
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(15.0),
              primary: Colors.white,
              textStyle: const TextStyle(
                fontSize: 20,
                fontFamily: 'Lemon Tea',
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
