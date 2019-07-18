import 'package:flutter/material.dart';

class FlexRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局Flex"),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Text("Flex是Row和Column的父类，子类只是固定了direction参数；\n"
              "除非你子widget的主轴方向需要动态改变，否则直接使用Row和Column一样的；\n"
              "这里着重说明Expanded的使用"),
          Text(
            "Expanded  可以按比例“扩伸”Row、Column和Flex子widget所占用的空间。通过flex为弹性系数来控制，0或null将无效。 ",
            style: TextStyle(color: Colors.red, fontSize: 15),
          ),
          Text(
              "其中有个Spacer 是Expanded的包装类,需要空白占位时可使用这个类,内部为Expanded >> SizedBox (0,0)，flex = 1"),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 20,
                    color: Colors.red,
                  ),
                  flex: 1,
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  child: Container(
                    height: 20,
                    color: Colors.green,
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
          _getExpandedDemo(1, 1, 1),
          _getExpandedDemo(1, 1, 0),
          _getExpandedDemo(2, 1, 1),
          _getExpandedDemo(3, 2, 1),
        ],
      ),
    );
  }
}

Widget _getExpandedDemo(int flex1, int flex2, int flex3) {
  return Container(
    padding: EdgeInsets.only(top: 5),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 20,
            color: Colors.red,
          ),
          flex: flex1,
        ),
        Expanded(
            child: Container(
              height: 20,
              color: Colors.blue,
            ),
            flex: flex2),
        Expanded(
          child: Container(
            height: 20,
            color: Colors.green,
          ),
          flex: flex3,
        )
      ],
    ),
  );
}
