import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isBusy = false;
  bool isLoggedIn = false;
  String errorMessage;
  String name;
  String picture;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth0',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Auth0'),
        ),
        body: Center(
          child: Text('Implement User Authentication'),
        ),
      ),
    );
  }
}
