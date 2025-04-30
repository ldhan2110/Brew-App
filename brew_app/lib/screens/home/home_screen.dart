import 'package:brew_app/models/brew.dart';
import 'package:brew_app/services/auth_service.dart';
import 'package:brew_app/services/database_service.dart';
import 'package:brew_app/widget/brew_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();
  final DatabaseService _databaseService = DatabaseService();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 60.0,
            ),
            child: Text('Bottom Sheet'), // Widget to show settings
          );
        },
      );
    }

    return StreamProvider<List<BrewModel>>.value(
      value: _databaseService.brews, // Stream of brew data from Firestore
      initialData: [],
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
              onPressed: _showSettingsPanel, // Show settings panel when pressed
              icon: Icon(Icons.settings, color: Colors.white),
            ),
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
