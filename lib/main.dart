import 'package:flutter/material.dart';
import 'package:flutter_app/test/carHomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarHomePage(),
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
    );
  }
}


