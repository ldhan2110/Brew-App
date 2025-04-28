import 'package:cloud_firestore/cloud_firestore.dart';
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
    final brewList = context.watch<QuerySnapshot?>();
    for (var brew in brewList!.docs) {
      print(brew.data());
    }
    return Container();
  }
}
