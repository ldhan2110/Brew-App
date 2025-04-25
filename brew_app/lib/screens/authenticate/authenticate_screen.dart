import "package:brew_app/screens/authenticate/signin_screen.dart";
import "package:flutter/material.dart";

class AuthenticateScreen extends StatefulWidget {
  const AuthenticateScreen({super.key});

  @override
  State<AuthenticateScreen> createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  @override
  Widget build(BuildContext context) {
    return SignInScreen();
  }
}
