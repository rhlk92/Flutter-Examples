import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
