import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trinity/Common/models/UserData.dart';

// Afficher les pseudos, puis role : status = Ne fonctionne pas.

class UserPseudo extends StatefulWidget {
  const UserPseudo({Key? key}) : super(key: key);

  @override
  State<UserPseudo> createState() => _UserPseudoState();
}

class _UserPseudoState extends State<UserPseudo> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context);
    return Text(
      user.pseudo.toString(),
      style: const TextStyle(fontSize: 27),
    );
  }
}
