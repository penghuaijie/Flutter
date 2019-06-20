import 'package:flutter/material.dart';
import 'package:flutter_color_plugin/flutter_color_plugin.dart';
/*
*MaterialApp
*Scaffold
*appBar
*bottomNavigationBar
*floatingActionButton
*RefreshIndicator
*Image
*PageView
* */

class StateFullGroupWidget extends StatefulWidget {
  @override
  _StateFullGroupWidgetState createState() => _StateFullGroupWidgetState();
}

class _StateFullGroupWidgetState extends State<StateFullGroupWidget> {
  //定义选中的index
  int _currentIndex = 0;

  // tabbar点击
  void _onItemTaped(int index) {
    this.setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefulWidget有状态组件',
      home: Scaffold(
        appBar: AppBar(title: Text('StatefulWidget')),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.android),
              title: Text('首页'),
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.album),
              title: Text('我的'),
              backgroundColor: Colors.white,
            )
          ],
          selectedItemColor: ColorUtil.color('#ff4081'),
          currentIndex: _currentIndex,
          onTap: _onItemTaped,
        ),
        // 更新页面 下拉刷新
        body: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(
                  children: <Widget>[
                    Home0(),
                  ],
                ),
                onRefresh: _handlerefresh)
            : Text('Home1'),
        // 底部悬浮框
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('love'),
        ),
      ),
      theme: ThemeData(
        primaryColor: ColorUtil.color('#ff4081'),
      ),
    );
  }

  // Future 模拟异步等待
  Future<Null> _handlerefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return;
  }
}

class Home0 extends StatelessWidget {
  TextStyle _textStyle = new TextStyle(
    color: ColorUtil.color('#ff4081'),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Image.network(
            'https://upload-images.jianshu.io/upload_images/1692043-4165c920692aa498.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/960',
          ),
          Container(
            width: 200,
            height: 30,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                hintText: 'i love you',
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: ColorUtil.color('#ff4081'),
                )
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            width: 200,
            height: 100,
            child: PageView(
              reverse: true,
              children: <Widget>[
                _itemView('page1', ColorUtil.color('#ff4081')),
                _itemView('page2', Colors.purple),
                _itemView('page3', Colors.green),
                _itemView('page4', Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemView (String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(title,style: TextStyle(fontSize: 20.0, color: Colors.white),),
    );
  }
}
