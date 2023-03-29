import 'package:flutter/material.dart';
import 'package:profile/screens/loginscreen.dart';
import 'package:profile/screens/registrationscreen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LoginPage(showRegisterPage:toggleScreens);
    } else {
      return RegisterPage(showLogInPage: toggleScreens);
    }
  }
}
