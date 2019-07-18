import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //AppBar，包含一个导航栏
          SliverAppBar(
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        "assets/image1.jpeg",
                        width: 50,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "This is Center Short Toast",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                    ),
                    Text("Action1")
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/image2.jpeg",
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  Text("Action2")
                ],
              ),
            ],
            pinned: true,
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'CustomScrollView控件',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              background: Image.asset(
                "assets/image5.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: GestureDetector(
                    child: Text(
                      "CustomScrollView控件",
                      style: TextStyle(color: Colors.red, fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIos: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                  ),
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 20),
                ),
                Text("CustomScrollView是可以使用sliver来自定义滚动模型（效果）的widget。\n"
                    "Sliver通常指具有特定滚动效果的可滚动块。\n"
                    "由于ListView和GridView等都持有自己的Scrollable，很难实现统一的滑动效果；所以使用对应的SliverList、SliverGrid来达到效果;滑动处理统一交给CustomScrollView\n"
                    "常用的Sliver有：SliverAppBar、SliverList、SliverGrid、SliverPadding、SliverToBoxAdapter等\n"
                    "这个Route使用控件依次为:SliverAppBar、SliverToBoxAdapter、SliverGrid、SliverList")
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}
