import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Screens/ProfilePage/edit_profile_page.dart';
import 'package:trinity/Common/utils/user_preferences.dart';
import 'package:trinity/Widgets/appbar_widget.dart';
import 'package:trinity/Widgets/button_widget.dart';
import 'package:trinity/Widgets/numbers_widget.dart';
import 'package:trinity/Widgets/profile_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    UserData user = UserPreferences.myUser;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagepath!,
            onClicked: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
    );
  }

  Widget buildName(UserData user) => Column(
        children: [
          Text(
            user.pseudo!,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            user.email!,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(UserData user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent),
            ),
            const SizedBox(height: 16),
            Text(user.about!,
                style: TextStyle(
                    fontSize: 16,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      );
}
