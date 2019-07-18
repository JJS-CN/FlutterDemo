import 'package:flutter/material.dart';

class SingleChildScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("SingleChildScrollView控件"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("可滚动控件都会包含一个Scrollable widget，它有一些共同属性\n"
                    "axisDirection：滚动方向。\n"
                    "physics：此属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作;如滑动到边界时ios和android效果不同\n"
                    "\t\tFlutter SDK中包含2个效果，可显式声明固定想要的效果\n"
                    "\t\t\t\tClampingScrollPhysics：Android下微光效果。\n"
                    "\t\t\t\tBouncingScrollPhysics：iOS下弹性效果。\n"
                    "controller：此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。"
                    "默认情况下，widget树中会有一个默认的PrimaryScrollController，"
                    "如果子树中的可滚动widget没有显式的指定controller并且primary属性值为true时（默认就为true），"
                    "可滚动widget会使用这个默认的PrimaryScrollController，"
                    "这种机制带来的好处是父widget可以控制子树中可滚动widget的滚动\n"),
                Text(
                  "Scrollbar",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                    "Scrollbar是一个Material风格的滚动指示器（滚动条）,将它作为可滚动widget的父widget即可；\n"
                    "在ios环境会自动转换成CupertinoScrollbar控件（IOS风格）\n"),
                Text(
                  "SingleChildScrollView",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                    "SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget；\n"
                    "reverse：反向展示，基于scrollDirection的值\n"
                    "primary：是否使用默认PrimaryScrollController，（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true\n"
                    "\n"
                    "需要注意的是，通常SingleChildScrollView只应在期望内容适合屏幕的情况下使用，它无法使用基于Sliver的延迟实例化，"
                    "如果预计视口通常包含超出屏幕尺寸的内容，那么SingleChildScrollView将会非常昂贵。"),
                Text(
                  "(这里的'非常昂贵'没有理解，需要更详细了解)\n",
                  style: TextStyle(color: Colors.red),
                ),
                Image.asset(
                  "assets/image5.jpeg",
                ),
                Image.asset(
                  "assets/image5.jpeg",
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ));
  }
}
