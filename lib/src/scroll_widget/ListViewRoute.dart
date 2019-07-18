import 'package:flutter/material.dart';

class ListViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const divider = const Divider(
      color: Colors.lightBlue,
      height: 13,
    );
    const divider2 = const Divider(
      color: Colors.deepPurple,
      height: 1,
    );
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("ListView控件"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text("ListView常用参数说明：\n"
                "itemExtent：该参数如果不为null将item高度强制固定，否则需要动态计算\n"
                "shrinkWrap：是否计算ListView的总长，默认false；ListView默认会尽可能多占用控件；"
                "但父类是scroll等无边界的widget时，就必须设置为true;\n"
                "addAutomaticKeepAlives：该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive widget中；"
                "在该列表项滑出视口时该列表项不会被GC;但如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。\n"
                "addRepaintBoundaries：该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。"
                "可以避免item重绘，但是当列表项重绘的开销非常小，不添加RepaintBoundary反而会更高效。"
                "和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。"),
          ),
          Text(
            "默认构造函数,直接传递一个Widget[]，适用于少量item。实际和SingleChildScrollView+Column的方式没有本质的区别",
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 80,
              color: Color(0xFFFFFFCC),
              child: ListView(
                children: _getChilds(),
              )),
          Text(
            "ListView.builder适合列表项比较多（或者无限）的情况，因为只有当子Widget真正显示的时候才会被创建",
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Text(
              "itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项。\n"
              "itemCount：列表项的数量，如果为null，则为无限列表。"),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 80,
              color: Color(0xFFFFFFCC),
              child: ListView.builder(
                  itemCount: null,
                  itemExtent: 30.0, //强制高度为50.0
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                      "$index",
                      textAlign: TextAlign.center,
                    );
                  })),
          Text(
            "ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一个separatorBuilder参数，该参数是一个分割器生成器。",
            style: TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          Text(
              "与ListView.builder还是存在差异的，itemCount不能为null（不能无限元素了）；itemExtent 无法限定高度；\n"
              "Divider返回的是分隔线，height为控件高度占位，实际还是居中绘制一条线不会变粗"),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 80,
              color: Color(0xFFFFFFCC),
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    "$index",
                    textAlign: TextAlign.center,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return index % 2 == 0 ? divider : divider2;
                },
              )),
        ],
      )),
    );
  }
}

List<Widget> _getChilds() {
  List<Widget> list = [];
  for (int i = 0; i < 10; i++) {
    list.add(Container(
        padding: EdgeInsets.all(3),
        child: Text(
          i.toString(),
          textAlign: TextAlign.center,
        )));
  }
  return list;
}

