import 'package:flutter/material.dart';

import 'package:flutter_color_plugin/flutter_color_plugin.dart';
import 'package:flutter_app/lessAndFulWidget/statelessGroupPage.dart';
import 'package:flutter_app/lessAndFulWidget/statefulGroupWidget.dart';

import 'openOtherApp.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('PHJFlutter'),
          ),
          body: RouterNavigator(),
        ),
        theme: ThemeData(
          primaryColor: ColorUtil.color('#ff4081'),
        ),
        // 定义路由
        routes: <String, WidgetBuilder>{
          'less': (BuildContext context) => StatelessGroupPage(),
          'full': (BuildContext context) => StateFullGroupWidget(),
          'open': (BuildContext context) => OpenApp(),
        }
        );
  }
}

class RouterNavigator extends StatefulWidget {
  @override
  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
              title: Text('${byName ? '' : '不'}通过路由跳转'),
              value: byName,
              onChanged: (value) {
                setState(() {
                  byName = value;
                });
              }),
          _item('StatelessWidget与基础组件', StatelessGroupPage(), 'less'),
          _item('StatefulWidget与基础组件', StateFullGroupWidget(), 'full'),
          _item('打开其它APP', OpenApp(), 'open'),
        ],
      ),
    );
  }

  _item(String title, page, String routerName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(byName) {
            Navigator.pushNamed(context, routerName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
