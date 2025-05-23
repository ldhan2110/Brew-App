import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown[100],
      child: Center(child: SpinKitChasingDots(color: Colors.brown, size: 50)),
    );
  }
}
