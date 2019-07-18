import 'package:flutter/material.dart';

class ImageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Image控件使用"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _getRowWidget(
                  context,
                  Image.network(
                    "http://img.mp.itc.cn/upload/20170111/5c7689d352eb4fbab1c3c9489f253dd7_th.jpeg",
                    width: 100,
                  ),
                  "从网络加载图片 : NetworkImage\n" +
                      "ImageProvider 是一个抽象类，主要定义了图片数据获取的接口load()，"
                          "从不同的数据源获取图片需要实现不同的ImageProvider ，"
                          "如AssetImage是实现了从Asset中加载图片的ImageProvider，"
                          "而NetworkImage实现了从网络加载图片的ImageProvider。"),
              _getRowWidget(
                  context,
                  Image(
                    image: AssetImage("assets/image5.jpeg"),
                    width: 100,
                  ),
                  "Image的基础参数：\n" +
                      "  this.width,this.height//图片的宽  高 \n" +
                      "  this.color, //图片的混合色值 \n" +
                      "  this.colorBlendMode, //混合模式 \n" +
                      "  this.fit,//缩放模式 \n" +
                      "  this.alignment = Alignment.center, //对齐方式 \n" +
                      "  this.repeat = ImageRepeat.noRepeat, //重复方式 \n"),
              Image.asset("assets/image5.jpeg"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                  ),
                  "width、height：用于设置图片的宽、高，"
                  "当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小"
                  "，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  " fit: BoxFit.cover \n相当于CenterCrop"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fill,
                  ),
                  " fit: BoxFit.fill \n相当于CenterFix"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  " fit: BoxFit.contain \n相当于CenterInsert"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ),
                  " fit: BoxFit.fitWidth \nfitWidth宽度占满，高度等比例缩放。增加Alignment.topCenter控制绘制对齐位置"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.bottomCenter,
                  ),
                  " Alignment.bottomCenter"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerRight,
                  ),
                  " fit: BoxFit.fitHeight \nfitHeight高度占满，宽度等比例缩放。增加Alignment.centerRight控制绘制对齐位置"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.center,
                  ),
                  " Alignment.center"),
              _getRowWidget(
                  context,
                  Image.asset(
                    "assets/image5.jpeg",
                    width: 100,
                    height: 50,
                    fit: BoxFit.fitHeight,
                    alignment: Alignment.centerLeft,
                  ),
                  " Alignment.centerLeft"),
              _getRowWidget(
                  context,
                  Row(
                    children: <Widget>[
                      Icon(
                        IconData(0xe606, fontFamily: "MyIcons"),
                        color: Colors.pinkAccent,
                        size: 60,
                      ),
                      Icon(
                        IconData(0xe613, fontFamily: "MyIcons"),
                        color: Colors.green,
                      ),
                      Icon(
                        IconData(0xe612, fontFamily: "MyIcons"),
                        color: Colors.yellow,
                        size: 40,
                      ),
                      Icon(
                        IconData(0xe605, fontFamily: "MyIcons"),
                        color: Colors.deepOrange,
                        size: 20,
                      ),
                      Icon(
                        IconData(0xe60d, fontFamily: "MyIcons"),
                        color: Colors.pink,
                        size: 30,
                      )
                    ],
                  ),
                  " 这里通过Icon控件来使用为ttf格式的图标字体。只能设置纯色，可通过阿里的www.iconfont.cn快捷生成ttf文件"),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getRowWidget(BuildContext context, Widget widget, String message) {
  return Container(
    padding: EdgeInsets.all(5),
    child: Row(
      children: <Widget>[
        widget,
        Expanded(
            child: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Text(message),
        )),
      ],
    ),
  );
}
