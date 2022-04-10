import 'package:flutter/material.dart';

class AuthContainer extends StatelessWidget {
  final Widget child;

  const AuthContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // DesignduContainer pour la partie Auth et Regis
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
