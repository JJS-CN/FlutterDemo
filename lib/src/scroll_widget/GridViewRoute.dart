import 'package:flutter/material.dart';

class GridViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("GridView控件"),
        ),
        body: Column(
          children: <Widget>[
            Text("GridView和ListView的大多数参数都是相同的，它们的含义也都相同\n"
                "需要关注的是gridDelegate参数，类型是SliverGridDelegate，它的作用是控制GridView子widget如何排列(layout)，"
                "SliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来实现具体的布局算法;\n"
                "SliverGridDelegateWithFixedCrossAxisCount 该子类实现了一个横轴为固定数量子元素的layout算法\n"
                "                     快捷函数GridView.count() ！！！\n"
                "crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了,即ViewPort横轴长度/crossAxisCount。\n"
                "mainAxisSpacing：主轴方向的间距。\n"
                "crossAxisSpacing：横轴方向子元素的间距。\n"
                "childAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。\n"
                "SliverGridDelegateWithMaxCrossAxisExtent 该子类实现了一个横轴子元素为固定最大长度的layout算法\n"
                "                     快捷函数GridView.extent() ！！！\n"),
            Expanded(
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //横轴三个子widget
                        childAspectRatio: 2.0 //宽高比(宽除以高得到的值)
                        ),
                    children: <Widget>[
                  Icon(Icons.ac_unit),
                  Icon(Icons.airport_shuttle),
                  Icon(Icons.all_inclusive),
                  Icon(Icons.beach_access),
                  Icon(Icons.cake),
                  Icon(Icons.free_breakfast)
                ]))
          ],
        ));
  }
}
