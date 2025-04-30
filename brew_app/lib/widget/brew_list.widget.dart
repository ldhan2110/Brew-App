import 'package:brew_app/models/brew.dart';
import 'package:brew_app/widget/brew_tile.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewListWidget extends StatefulWidget {
  const BrewListWidget({super.key});

  @override
  State<BrewListWidget> createState() => _BrewListWidgetState();
}

class _BrewListWidgetState extends State<BrewListWidget> {
  @override
  Widget build(BuildContext context) {
    final brewList = context.watch<List<BrewModel>>();
    return ListView.builder(
      itemCount: brewList.length,
      itemBuilder: (context, index) {
        final brew = brewList[index];
        return BrewTile(brew: brew);
      },
    );
  }
}
