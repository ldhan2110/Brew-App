import 'package:brew_app/models/user.dart';
import 'package:brew_app/screens/wrapper.dart';
import 'package:brew_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 👈 Ensure Flutter is initialized
  await Firebase.initializeApp(); // 👈 Initialize Firebase
  runApp(const BrewApp());
}

class BrewApp extends StatelessWidget {
  const BrewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserAuthModel?>.value(
      value: AuthService().user, // 👈 Listen to the authentication state
      initialData: null,
      child: MaterialApp(
        title: 'Brew App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        ),
        home: Wrapper(),
      ),
    );
  }
}
