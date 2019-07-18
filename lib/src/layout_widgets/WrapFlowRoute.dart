import 'package:flutter/material.dart';

class WrapFlowRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局Wrap和Flow"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                "在使用Row和Column时，如果子widget超出屏幕范围，则会报溢出屏幕错误，此时可以使用Expanded来动态限制，也可以使用Wrap流式布局来达到换行效果"),
            Text("很多属性与Row和Column相同,但有3个独特属性\n"
                "spacing：主轴方向子widget的间距\n"
                "runSpacing：纵轴方向的间距\n"
                "runAlignment：纵轴方向的对齐方式,这里演示的center"),
            Row(
              children: _getChips(),
            ),
            Wrap(
              spacing: 8.0, // 主轴(水平)方向间距
              runSpacing: 8.0, // 纵轴（垂直）方向间距
              alignment: WrapAlignment.center, //沿主轴方向居中
              children: _getChips(),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Flow",
                  style: TextStyle(color: Colors.blue, fontSize: 20)),
              TextSpan(
                  text:
                      "   Flow需要自己实现子widget的位置转换,用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。\n"
                      "主要参数delegate，需要继承FlowDelegate并实现子widget位置计算"),
              TextSpan(text: "\n优点：", style: TextStyle(color: Colors.blue)),
              TextSpan(
                  text:
                      "性能好(对child尺寸以及位置调整非常高效)、灵活(自定义布局策略 paintChildren()方法)"),
              TextSpan(text: "\n缺点：", style: TextStyle(color: Colors.red)),
              TextSpan(text: "使用复杂、不能自适应子widget大小（通过getSize()方法返回固定大小）"),
            ])),
            Flow(
              delegate: TestFlowDelegate(),
              children: _getChips(),
            ),
            Text("FlowDelegate有以下重写方法\n"
                "bool shouldRelayout(covariant FlowDelegate oldDelegate) => false;  是否需要重新布局\n"
                "bool shouldRepaint(covariant FlowDelegate oldDelegate);   是否需要重绘；\n"
                "Size getSize(BoxConstraints constraints);  设置Flow的尺寸\n"
                "void paintChildren(FlowPaintingContext context);   child的绘制控制代码，可以调整尺寸位置；\n"
                "\n"
                "其中主要的FlowPaintingContext参数如下：\n"
                "Size getSize; 获取childWidget可以绘制的最大的范围，这个值取决于Flow的大小\n"
                "int getChildCount; 获取childWidget的个数\n"
                "Size getChildSize(int i); 获取第i个childWidget的大小\n"
                "void paintChild(int i, { Matrix4 transform, double opacity = 1.0 });  用矩阵Matrix4布局childWidget"),
            Text(
              "Matrix4在之后再学习吧；执行时FlowDelegate的调用顺序：\n"
              "1：getSize(BoxConstraints constraints)  \n"
              "2：void paintChildren(FlowPaintingContext context)\n"
              "具体的详细注释在代码中",
              style: TextStyle(color: Colors.red),
            ),
            Flow(
              delegate: FlowDelegateDemo(),
              children: _getCircles(16),
            )
          ],
        ),
      ),
    );
  }
}

class FlowDelegateDemo extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = 10.0;
    for (int i = 0; i < context.childCount; i++) {
      var cW = context.getChildSize(i).width;
      var top = 0.0;
      int index = i % 4;
      bool up = ((i / 4) % 2).toInt() == 1;
      print("${index}   ${up}   ${(i / 4).toInt()}");

      context.paintChild(i,
          transform: new Matrix4.translationValues(
              x, top + (6 * (up ? index : (4 - index))), 0.0));
      x += cW;
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 50);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  /** 需要学习Dart构造方法的使用*/
  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    //child的绘制控制代码，可以调整尺寸位置；
    if (this.margin == null) {
      this.margin = EdgeInsets.only(right: 10, left: 5);
    }
    //这里的margin用于控制widget之间的间距控制，取到起始坐上角坐标(原点)
    var x = margin.left;
    var y = margin.top;
    /**计算每一个子widget的位置*/
    for (int i = 0; i < context.childCount; i++) {
      //遍历所有的children
      var w = context.getChildSize(i).width + x + margin.right; //得到child的最右坐标位置
      //当右坐标位置 <= Flow宽度时，说明可以放q下，所以直接放置
      if (w <= context.size.width) {
        //将这个child从原点偏移xy的位置进行绘制。第一个其实只偏移了一个margin而已
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        //将上一个child的右端点保存为左端点，再循环计算时将不会重叠
        x = w + margin.left;
      } else {
        //如果超出Flow宽度，就需要换行。将x重置，将y进行计算叠加
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        //重计算x位置
        var w = context.getChildSize(i).width + x + margin.right;
        x = w + margin.left;
      }
    }
  }

  @override
  bool shouldRelayout(FlowDelegate oldDelegate) {
    // 是否需要重新布局。默认是false
    return super.shouldRelayout(oldDelegate);
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小，由于第一个调用，所以很尴尬，高度只能写死，应该只适合用于小部件的自定义
    return Size(double.infinity, 150.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    //是否需要重绘；在不相等时重绘
    return oldDelegate != this;
  }
}

var ZIMU = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

List<Widget> _getCircles(int count) {
  List<Widget> list = [];
  for (int i = 0; i < count; i++) {
    list.add(Container(
      padding: EdgeInsets.all(2),
      width: 25,
      height: 25,
      child: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text(
            ZIMU[i],
            style: TextStyle(color: Colors.white),
          )),
    ));
  }
  return list;
}

List<Widget> _getChips() {
  return <Widget>[
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
      label: new Text('Hamilton'),
    ),
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
      label: new Text('Lafayette'),
    ),
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
      label: new Text('Mulligan'),
    ),
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      label: new Text('Laurens'),
    ),
    new Chip(
      avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
      label: new Text('Ends'),
    ),
  ];
}
