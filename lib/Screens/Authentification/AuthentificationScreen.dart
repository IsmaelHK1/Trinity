import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity/common/utils/Loading.dart';
import 'package:trinity/common/utils/TextInputDecoration.dart';
import 'package:trinity/services/AuthentificationService.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({Key? key}) : super(key: key);

  @override
  State<AuthentificationScreen> createState() => _AuthentificationScreenState();
}

class _AuthentificationScreenState extends State<AuthentificationScreen> {
  final AuthentificationService _auth = AuthentificationService();
  final _formKey = GlobalKey<FormState>();

  String error = '';
  bool loading = false;
  bool showSignInScreen = true;

  final pseudoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final aboutController = TextEditingController();

  void dispose() {
    pseudoController.dispose();
    emailController.dispose();
    passwordController.dispose();
    ageController.dispose();
    aboutController.dispose();
    super.dispose();
  }

  void toggleViewState() {
    setState(() {
      _formKey.currentState?.reset();
      error = '';
      pseudoController.text = '';
      emailController.text = '';
      passwordController.text = '';
      ageController.text = '';
      aboutController.text = '';
      showSignInScreen = !showSignInScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const LoadingScreen()
        : Scaffold(
            backgroundColor: const Color.fromRGBO(24, 24, 25, 1.0),
            appBar: AppBar(
              backgroundColor: Colors.blueAccent,
              elevation: 0.0,
              title: Text(
                showSignInScreen ? 'Sign in to Trinity' : 'Register to Trinity',
                style: const TextStyle(
                    fontFamily: 'Lemon tea', color: Colors.white),
              ),
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.person),
                  label: Text(showSignInScreen ? 'Register' : 'Sign In'),
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () => toggleViewState(),
                )
              ],
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: TextInputDecoration.copyWith(
                            hintText: 'Pseudo (min 6 chars)'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a pseudo';
                          }
                          if (value.length < 6) {
                            return 'Your pseudo must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration:
                            TextInputDecoration.copyWith(hintText: 'E-mail'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a valid e-maill';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: TextInputDecoration.copyWith(
                          hintText: 'Password (min 6 chars)',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a password';
                          }
                          if (value.length < 6) {
                            return 'Enter a password with at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        decoration: TextInputDecoration.copyWith(
                          hintText: 'Age',
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: aboutController,
                        decoration: TextInputDecoration.copyWith(
                          hintText: 'Enter a short description of yourself',
                        ),
                        maxLines: 6,
                        minLines: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
