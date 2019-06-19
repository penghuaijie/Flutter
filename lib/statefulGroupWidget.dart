import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';
/*
*MaterialApp
*Scaffold
*
* */

class StateFullGroupWidget extends StatefulWidget {
  @override
  _StateFullGroupWidgetState createState() => _StateFullGroupWidgetState();
}

class _StateFullGroupWidgetState extends State<StateFullGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget有状态组件',
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget')),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.android),
              title: Text('首页'),
              backgroundColor: Colors.white,
              activeIcon: Icon(
                Icons.android,
                color: ColorUtil.color('#ff4081'),
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.album),
              title: Text('我的'),
              backgroundColor: Colors.white,
              activeIcon: Icon(
                Icons.album,
                color: ColorUtil.color('#ff4081'),
              ))
        ]
        ),
      ),
      theme: ThemeData(
        primaryColor: ColorUtil.color('#ff4081'),
      ),
    );
  }
}
