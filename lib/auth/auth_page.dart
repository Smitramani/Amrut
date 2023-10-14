import 'package:amrut/pages/login.dart';
import 'package:amrut/pages/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override

  //initally, shoe the login page
  bool showLoginiscreen = true;

  void toggleScreens() {
    setState(() {
      showLoginiscreen = !showLoginiscreen;
    });
  }

  Widget build(BuildContext context) {
    if (showLoginiscreen) {
      return loginscreen(showRegisterScreen: toggleScreens);
    } else {
      return signupscreen(showLoginScreen: toggleScreens);
    }
  }
}
