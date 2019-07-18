import 'package:flutter/material.dart';
import 'Const.dart';

class LayoutWidgetsRoute extends StatelessWidget {
  var widgetList = [
    "线性布局Row和Column",
    "弹性布局Flex",
    "流式布局Wrap和Flow",
    "层叠布局Stack和Positioned"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("布局控件列表"),
      ),
      body: ListView.separated(
          itemBuilder: (_, int index) {
            return GestureDetector(
              child: ListTile(
                title: Text(widgetList[index]),
              ),
              onTap: () {
                var name = widgetList[index];
                if (name == "线性布局Row和Column") {
                  Navigator.pushNamed(context, RouteKey_RowColumRoute);
                } else if (name == "弹性布局Flex") {
                  Navigator.pushNamed(context, RouteKey_FlexRoute);
                } else if (name == "流式布局Wrap和Flow") {
                  Navigator.pushNamed(context, RouteKey_WrapFlowRoute);
                } else if (name == "层叠布局Stack和Positioned") {
                  Navigator.pushNamed(context, RouteKey_StackPositionedRoute);
                }
              },
            );
          },
          separatorBuilder: (_, int index) {
            return Divider(
              color: Colors.cyanAccent,
            );
          },
          itemCount: widgetList.length),
    );
  }
}
