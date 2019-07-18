import 'package:flutter/material.dart';

class AssetsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("本地资源"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Text("本地图片："),
                    /** 此处需要在pubspec.yaml 进行配置声明才可使用*/
                    Image(image: AssetImage("assets/image1.jpeg")),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("网络图片："),
                    ),
                    Image(
                      image: NetworkImage(
                          "http://img.mp.itc.cn/upload/20170111/5c7689d352eb4fbab1c3c9489f253dd7_th.jpeg"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Image.network(
                          "http://img.mp.itc.cn/upload/20170111/53f8a0a567aa4b8b809c4b84c1889ea8_th.jpeg"),
                    )
                  ],
                )),
          ),
        ));
  }
}
