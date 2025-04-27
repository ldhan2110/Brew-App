import 'package:brew_app/models/user.dart';
import 'package:brew_app/screens/authenticate/authenticate_screen.dart';
import 'package:brew_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user =
        context.watch<UserAuthModel?>(); // 👈 Get the user from the provider

    return user == null
        ? AuthenticateScreen()
        : HomeScreen(); // 👈 Check if user is logged in
  }
}
