import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:trinity/Common/models/UserData.dart';
import 'package:trinity/Widgets/appbar_widget.dart';
import 'package:trinity/Widgets/button_widget.dart';
import 'package:trinity/Widgets/profile_widget.dart';
import 'package:trinity/Widgets/textfield_widget.dart';
import '../../Common/utils/user_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  UserData user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagepath!,
              isEdit: true,
              onClicked: () async {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Full Name',
              text: user.pseudo!,
              onChanged: (pseudo) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Age',
              text: user.birthday!,
              onChanged: (birthday) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'Email',
              text: user.email!,
              onChanged: (email) {},
            ),
            const SizedBox(height: 24),
            TextFieldWidget(
              label: 'About',
              text: user.about!,
              maxLines: 5,
              onChanged: (about) {},
            ),
          ],
        ),
      ),
    );
  }
}
