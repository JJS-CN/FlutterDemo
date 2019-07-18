import 'package:flutter/material.dart';

class RowColumRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局Row和Column"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Row可以在水平方向排列其子widget，Row的高度等于子Widgets中最高的子元素高度\n "
                  "     textDirection  表示水平方向子widget的布局顺序,默认ltr,可选rtl"),
              _getRowDemo(Row(
                children: _getContainers(),
                textDirection: TextDirection.ltr,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                textDirection: TextDirection.rtl,
              )),
              Text("mainAxisSize  表示Row在主轴(水平)方向占用的空间，默认是max占用尽可能多空间,可选min"),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: _getContainers(),
                ),
                color: Colors.grey,
              ),
              Container(
                width: 5,
                height: 5,
              ),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _getContainers(),
                ),
                color: Colors.grey,
              ),
              Text(
                  "mainAxisAlignment  子Widgets的对齐方式，mainAxisSize.max时才有意义。下面效果分别为：start，center，end，spaceBetween，spaceAround，spaceEvenly"),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.start,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.center,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.end,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              )),
              _getRowDemo(Row(
                children: _getContainers(),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              )),
              Text(
                  "verticalDirection：表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上向下排列，up为从下向上排列；"
                  "crossAxisAlignment：表示子Widgets在纵轴方向的对齐方式，有start，end，center"),
              Text(
                "重要！！crossAxisAlignment的对齐方向优先考虑verticalDirection的方向",
                style: TextStyle(color: Colors.red),
              ),
              Row(
                children: <Widget>[
                  Text("这是 V.down 和 C.end 的效果"),
                  _getRowDemo(Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    verticalDirection: VerticalDirection.down,
                    children: _getContainers2(30),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("这是 V.down 和 C.start 的效果"),
                  _getRowDemo(Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    children: _getContainers2(30),
                  )),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("这是 V.up 和 C.end 的效果"),
                  _getRowDemo(Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    verticalDirection: VerticalDirection.up,
                    children: _getContainers2(30),
                  )),
                ],
              ),
              Text(
                  "同理，textDirection 和 mainAxisAlignment 同样有联用效果 T.rtl 和 M.end"),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _getContainers(),
                ),
                color: Colors.grey,
              ),
              Text(
                "  \n Colum 参数和使用方法和Row一样，它们其实都是弹性布局Flex的子类。",
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
              Text(
                  "特殊情况：Row或Column嵌套时，最外层能达到最大效果,但内层即使设置了MainAxisSize.max也只是实际宽高；\n"
                  "如果要让里面的Column占满外部Column，可以使用Expanded widget"),
              Row(
                children: <Widget>[
                  Container(
                    height: 120,
                    width: 100,
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[Text("Column >> Column ")],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 100,
                    padding: EdgeInsets.all(10),
                    color: Colors.green,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            child: Container(
                          color: Colors.red,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[Text("Column >> Expanded >> Container >> Column")],
                          ),
                        ))
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

Widget _getRowDemo(Row widget) {
  return Container(
    padding: EdgeInsets.only(top: 5),
    child: widget,
  );
}

List<Widget> _getContainers() {
  return _getContainers2(15);
}

List<Widget> _getContainers2(double one) {
  return <Widget>[
    Container(
      width: 80,
      height: one,
      color: Colors.red,
    ),
    Container(
      width: 80,
      height: 15,
      color: Colors.green,
    ),
    Container(
      width: 80,
      height: 15,
      color: Colors.blue,
    )
  ];
}
