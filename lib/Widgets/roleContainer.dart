import 'package:flutter/material.dart';

class RoleContainer extends StatelessWidget {
  final Widget child;

  const RoleContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Design du Container pour la partie Auth et Regis
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(color: Colors.white38),
        ],
      ),
      child: child,
    );
  }
}
