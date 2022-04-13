import 'package:flutter/material.dart';
import 'package:trinity/Widgets/roleContainer.dart';

class ClassChoiceScreen extends StatefulWidget {
  const ClassChoiceScreen({Key? key}) : super(key: key);

  @override
  State<ClassChoiceScreen> createState() => _ClassChoiceScreenState();
}

class _ClassChoiceScreenState extends State<ClassChoiceScreen> {
  @override
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.orange,
                  margin: const EdgeInsets.all(25.0),
                  child: const FlutterLogo(
                    size: 60.0,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/TankIcone.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/DpsIcone.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
                Container(
                  color: Colors.blue,
                  margin: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    'assets/images/HealerIcone.png',
                    width: 100.0,
                    height: 100.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                RoleContainer(
                  child: Flexible(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta dui vitae diam volutpat, at volutpat leo sodales. Sed pulvinar libero eget elit interdum gravida. Suspendisse potenti. Quisque lacinia lacinia elit, non aliquet ipsum ullamcorper sed. Duis libero urna, egestas scelerisque diam ut, interdum vulputate erat. Maecenas sed dui nec justo aliquam scelerisque. Donec et tellus vitae mi mattis facilisis. Sed imperdiet leo non aliquet egestas. In orci risus, tincidunt quis porta sit amet, euismod at enim.',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
