import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.4, 1, 0.9],
            colors: [
              Color(0xFFe0ebec),
              Color(0xFFdcd1d5),
              Color(0xFFc8a6b1),
              Color(0xFFa81743),
            ],
          ),
        ),
      child: Center(
        child: SpinKitFadingCube(
          color: Colors.pink[700],
          size: 50.0,
        ),
      ),
    );
  }
}