import 'package:flutter/material.dart';
import 'package:Flutter_Learn/src/Const.dart';

class SimpleWidgetListRoute extends StatelessWidget {
  var widgetList = ["Text", "Button", "Image", "SelectBox", "TextField"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("简单控件列表"),
      ),
      body: ListView.separated(
          itemBuilder: (_, int index) {
            return GestureDetector(
              child: ListTile(
                title: Text(widgetList[index]),
              ),
              onTap: () {
                var name = widgetList[index];
                if (name == "Text") {
                  Navigator.pushNamed(context, RouteKey_TextRoute);
                } else if (name == "Button") {
                  Navigator.pushNamed(context, RouteKey_ButtonRoute);
                } else if (name == "Image") {
                  Navigator.pushNamed(context, RouteKey_ImageRoute);
                } else if (name == "SelectBox") {
                  Navigator.pushNamed(context, RouteKey_SelectBoxRoute);
                } else if (name == "TextField") {
                  Navigator.pushNamed(context, RouteKey_TextFieldRoute);
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
