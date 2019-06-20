import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';
/*
* Container
* Text
* Icon
* CloseButton
* BackButton
* Chip
* Divider
* Card
* AlertDialog
* 以上组件的练习
* */
class StatelessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Text(
            'hello world',
            style: TextStyle(
              color: ColorUtil.color('#ff4081'),
              fontSize: 40.0,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.android,
            color: ColorUtil.color('#ff4081'),
            size: 60,
          ),
          CloseButton(),
          BackButton(),
          Chip(
            label: Text('penghuaijie'),
            avatar: Icon(
              Icons.android,
            ),
          ),
          Divider(
            color: ColorUtil.color('#ff4081'),
            height: 10,
            indent: 20,
          ),
          Card(
            color: ColorUtil.color('#ff4081'),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: Container(
              child: Text(
                'i love you',
                style: TextStyle(
//                  color: ColorUtil.color('#ff4081'),
                  fontSize: 40.0,
                ),
              ),
            ),
          ),
          AlertDialog(
            title: Text('WJM'),
            content: Text('I love you'),
          )
        ],
      ),
    );
  }
}
