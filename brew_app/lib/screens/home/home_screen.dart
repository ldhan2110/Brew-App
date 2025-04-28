import 'package:brew_app/services/auth_service.dart';
import 'package:brew_app/services/database_service.dart';
import 'package:brew_app/widget/brew_list.widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: _databaseService.brews, // Stream of brew data from Firestore
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text(
            'Brew App',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: () async {
                await _authService.signOut(); // Sign out the user
              },
            ),
          ],
        ),
        body: const BrewListWidget(), // Widget to display the list of brews
      ),
    );
  }
}
