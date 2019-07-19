import 'package:flutter/material.dart';
import 'FilePathDemoRoute.dart';

class PubListRoute extends StatelessWidget {
  var widgetList = [
    "本地File文件操作",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("第三方Package包"),
      ),
      body: ListView.separated(
          itemBuilder: (_, int index) {
            return GestureDetector(
              child: Container(
                padding: EdgeInsets.all(9),
                child: Text(widgetList[index]),
              ),
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new FilePathProviderRoute()));
                    break;
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
