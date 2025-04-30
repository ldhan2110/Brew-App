import 'package:brew_app/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final BrewModel brew;
  const BrewTile({super.key, required this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.brown[brew.strength],
          ),
          title: Text(
            brew.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.brown[600],
            ),
          ),
          subtitle: Text('Takes: ${brew.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
