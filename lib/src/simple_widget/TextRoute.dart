import 'package:flutter/material.dart';

class TextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("Text控件使用"),
        ),
        body: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("基础-什么都不设置"),
              Text(
                "背景色 style: TextStyle(backgroundColor: Colors.cyan)",
                style: TextStyle(backgroundColor: Colors.cyan),
              ),
              Text(
                "改变大小与颜色 style: TextStyle(fontSize: 12, color: Colors.redAccent)",
                style: TextStyle(fontSize: 12, color: Colors.redAccent),
              ),
              Text(
                "倾斜样式 style: TextStyle(fontStyle: FontStyle.italic)",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                "下划线  style: TextStyle(decoration: TextDecoration.underline,)",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
              Text(
                "下划虚线    style: TextStyle(decoration: TextDecoration.underline,"
                    "\n             decorationStyle: TextDecorationStyle.dashed)",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text(
                "对齐方式    textAlign: TextAlign.center    " + "增加长度文本 " * 4,
                textAlign: TextAlign.center,
              ),
              Text(
                "限制行数与省略号     maxLines: 2,overflow: TextOverflow.ellipsis            " +
                    "增加长度文本长度文本!!!  " * 4,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "富文本样式("),
                TextSpan(
                    text: "相对复杂", style: TextStyle(color: Colors.deepOrange)),
                TextSpan(text: ")"),
                TextSpan(
                    text: "\$",
                    style: TextStyle(color: Colors.red, fontSize: 12)),
                TextSpan(
                    text: "125元",
                    style: TextStyle(color: Colors.cyanAccent, fontSize: 22)),
                TextSpan(text: "\n 使用\\n执行换行"),
              ])),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                child: Column(
                  children: <Widget>[
                    Text(
                      "我设置了 TextAlign.center 和TextDirection.rtl,两个参数都是控制对齐方式，以textAlign优先 \n 第二行",
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                    Text("我什么都没有设置 Column 默认居中展示"),
                    Text(
                        "通过设置textDirection: TextDirection.rtl 可控制整体的文本位置，优先低于textAlign")
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                child: DefaultTextStyle(
                    style: TextStyle(fontSize: 15, color: Colors.red),
                    child: Column(
                      verticalDirection: VerticalDirection.up,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("我是第一个，但以为verticalDirection: VerticalDirection.up 被颠倒"),
                        Text("外面包裹DefaultTextStyle统一给子节点应用字体样式"),
                        Text(
                            "1 但可通过inherit取消默认样式 style: TextStyle(inherit: false, color: Colors.black)",
                            style:
                            TextStyle(inherit: false, color: Colors.black)),
                        Text("2"),
                        Text("3"),
                        Text("4")
                      ],
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5, 20, 5, 5),
                child: Text(
                  "本地字体文件应用Hello Word,this is new Font,are you see?",style: const TextStyle(fontFamily: "HanabiFont"),
                ),
              )
            ],
          ),
        )),);
  }
}
