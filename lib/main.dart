import 'package:flutter/material.dart';

import 'package:flutter_app/test/carHomePage.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'statelessGroupPage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PHJFlutter'),
        ),
        body: StatelessGroupPage(),
      ),
      theme: ThemeData(
        primaryColor: ColorUtil.color('#ff4081'),
      ),
    );
  }
}


