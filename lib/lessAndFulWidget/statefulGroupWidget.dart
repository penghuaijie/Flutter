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

/*
*FractionallySizedBox
* ClipRRect
* ClipOval
* borderRadius
* Opacity
* widthFactor
* decoration
* Stack 和 Positioned
* Wrap runSpacing Spacing
* Column Expanded
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
    return Home0();
  }

  // Future 模拟异步等待
  Future<Null> _handlerefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
    return;
  }
}

/*
* MaterialApp(
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
            : Column(
                children: <Widget>[
                  Text('Home1'),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('Home12222222'),
                    ),
                  ),
                ],
              ),
        // 底部悬浮框
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('love'),
        ),
      ),
      theme: ThemeData(
        primaryColor: ColorUtil.color('#ff4081'),
      ),
    );*/

class Home0 extends StatelessWidget {
  TextStyle _textStyle = new TextStyle(
    color: ColorUtil.color('#ff4081'),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: _textStyle.color,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('stateFulWidget'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        'https://upload-images.jianshu.io/upload_images/1692043-4165c920692aa498.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/960',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.network(
                          'https://upload-images.jianshu.io/upload_images/1692043-4165c920692aa498.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/960',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.purple),
                      child: Text('宽度撑满'),
                    ),
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      _chip('flutter1'),
                      _chip('flutter2'),
                      _chip('flutter3'),
                      _chip('flutter4'),
                      _chip('flutter5'),
                      _chip('flutter6'),
                      _chip('flutter7'),
                    ],
                  ),
                ],
              ),
              Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/images/LYE2.jpg'),
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Image(
                      width: 50,
                      height: 50,
                      image: AssetImage('assets/images/LYE3.jpg'),
                    ),
                  ),
                ],
              ),
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
                      )),
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
        ),
      ),
    );
  }

  Widget _itemView(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: color),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
    );
  }

  _chip(String title) {
    return Chip(
        avatar: Image(
          image: AssetImage('assets/images/LYE4.jpg'),
        ),
        label: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}
