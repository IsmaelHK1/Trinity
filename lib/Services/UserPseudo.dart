import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Common/models/UserData.dart';

class UserPseudo extends StatefulWidget {
  const UserPseudo({Key? key}) : super(key: key);

  @override
  State<UserPseudo> createState() => _UserPseudoState();
}

class _UserPseudoState extends State<UserPseudo> {
  @override
  Widget build(BuildContext context) {
    final pseudo = Provider.of<UserData>(context).pseudo;
    return Text(
        pseudo.toString(),
        style: const TextStyle(fontSize: 28),
    );
  }
}
