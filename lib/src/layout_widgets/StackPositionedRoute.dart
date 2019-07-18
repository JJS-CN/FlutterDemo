import 'package:flutter/material.dart';

class StackPositionedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("层叠布局Stack和Positioned"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text("Stack 相当于FrameLayout,允许子widget层叠。\n"
                  "alignment：决定如何去定位没有明确约束的子widget\n"
                  "textDirection：和Row、Wrap一样道理，作为alignment的参考系\n"
                  "fit：没有定位的子widget如何去适应Stack的大小，StackFit.loose 子widget大小，StackFit.expand 最大化\n"
                  "overflow：决定超出Stack的子widget如何显示，Overflow.clip和Overflow.visible\n"
                  "Positioned  给予子widget约束，参考系为Stack的边界"),
              _getStackDemo(
                  "无任何参数赋予，默认情况",
                  Stack(
                    children: <Widget>[Text("AAA"), Text("BBB")],
                  )),
              _getStackDemo(
                  "只有alignment: AlignmentDirectional.bottomStart",
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[Text("AAA"), Text("BBB")],
                  )),
              _getStackDemo(
                  "有alignment: AlignmentDirectional.bottomStart\n"
                  "和textDirection: TextDirection.rtl",
                  Stack(
                    textDirection: TextDirection.rtl,
                    alignment: AlignmentDirectional.bottomStart,
                    children: <Widget>[Text("AAA"), Text("BBB")],
                  )),
              _getStackDemo(
                  "只对B包裹Positioned，并给予左偏移20和上偏移30\n"
                  "B对象就会偏移绘制",
                  Stack(
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Text("AAA"),
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.green,
                          child: Text("BBB"),
                        ),
                        left: 20,
                        top: 30,
                      )
                    ],
                  )),
              _getStackDemo(
                  "在上面的基础添加fit: StackFit.expand\n"
                  "由于A对象未约束，所以被放大绘制",
                  Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Text("AAA", textAlign: TextAlign.center),
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.green,
                          child: Text(
                            "BBB",
                          ),
                        ),
                        left: 20,
                        top: 30,
                      )
                    ],
                  )),
              _getStackDemo(
                  "只对B包裹Positioned，并给予左偏移20和上偏移55\n"
                  "B对象已经超出Stack边界,会被clip裁剪\n"
                  "设置overflow: Overflow.visible可超出边界绘制",
                  Stack(
                    overflow: Overflow.visible,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        child: Text("AAA"),
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.green,
                          child: Text("BBB"),
                        ),
                        left: 20,
                        top: 55,
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}

Widget _getStackDemo(String msg, Widget widget) {
  return Row(
    children: <Widget>[
      Container(
        margin: EdgeInsets.all(5),
        width: 60,
        height: 60,
        color: Colors.lightBlueAccent,
        child: widget,
      ),
      Text(msg)
    ],
  );
}
