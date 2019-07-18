import 'package:flutter/material.dart';
import 'Const.dart';

class ActivitysRoute extends StatelessWidget {
  var widgetList = [
    "APP主界面效果",
    "",
    "",
    ""
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("具体页面效果列表"),
      ),
      body: ListView.separated(
          itemBuilder: (_, int index) {
            return GestureDetector(
              child: ListTile(
                title: Text(widgetList[index]),
              ),
              onTap: () {
                var name = widgetList[index];
                if (name == "APP主界面效果") {
                  Navigator.pushNamed(context, RouteKey_HomeActivityRoute);
                } else if (name == "") {
                  Navigator.pushNamed(context, RouteKey_FlexRoute);
                } else if (name == "") {
                  Navigator.pushNamed(context, RouteKey_WrapFlowRoute);
                } else if (name == "") {
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
