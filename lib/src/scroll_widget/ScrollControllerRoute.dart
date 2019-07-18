import 'package:flutter/material.dart';

class ScrollControllerRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ScrollControllerState();
  }
}

class ScrollControllerState extends State<ScrollControllerRoute> {
  ScrollController _controller = new ScrollController(
      initialScrollOffset: 101, keepScrollOffset: true, debugLabel: ""); //滚动控制器

  bool hasScrollTopBtn = false; //是否需要滚动到顶部按钮
  String _progress = "0%"; //保存进度百分比
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      if (_controller.offset < 200 && hasScrollTopBtn) {
        setState(() {
          hasScrollTopBtn = false;
        });
      } else if (_controller.offset >= 200 && hasScrollTopBtn == false) {
        setState(() {
          hasScrollTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动与监听与ScrollController"),
      ),
      body: Column(
        children: <Widget>[
          Text("Flutter中可以用ScrollController来控制可滚动widget的滚动位置；"
              "一个ScrollController可以同时被多个Scrollable Widget使用；\n"
              "控制原理=》》当ScrollController和Scrollable Widget关联时，"
              "Scrollable Widget首先会调用ScrollController的createScrollPosition()方法来创建一个ScrollPosition来存储滚动位置信息，"
              "接着，Scrollable Widget会调用attach()方法，将创建的ScrollPosition添加到ScrollController的positions属性中，这一步称为“注册位置”，"
              "只有注册后animateTo() 和 jumpTo()才可以被调用。"
              "当Scrollable Widget销毁时，会调用ScrollController的detach()方法，将其ScrollPosition对象从ScrollController的positions属性中移除，这一步称为“注销位置”；"
              "\n"
              "在initState方法中通过_controller.addListener监听滑动，在dispose方法中_controller.dispose();释放资源防止内存泄漏\n"
              "ScrollController构造函数：initialScrollOffset ：设定初始滚动位置\n"
              "ScrollController构造函数：keepScrollOffset  ： 是否保存滚动位置；"
              "为true时，每次滚动结束都会将滚动位置offset存储到PageStorage中（PageStorage是一个用于保存页面(路由)相关数据的功能型Widget，它拥有一个存储桶（bucket））\n"
              "tabview或viewpager在切换时会将state销毁重建，此时滚动状态将丢失，通过显式的指定PageStorage来恢复滚动位置【ListView(key: PageStorageKey(1), ... );】\n"
              "ScrollController.offset：当前滚动的位置。等同于position.pixels或者controller.positions.elementAt(index).pixels\n"
              "ScrollController.jumpTo(double offset)、animateTo(double offset,...)：跳转到指定的位置,后者有动画;最终调用持有的所有ScrollPosition的jumpTo()\n"
              "滚动监听：：Flutter 中子Widget可以通过发送通知（Notification）与父(包括祖先)Widget通信（冒泡通知）。"
              "父Widget可以通过NotificationListener Widget来监听自己关注的通知（如果widget返回true时，表示冒泡终止）"),
          Expanded(
              child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification notification) {
                  /* pixels：当前滚动位置。
                  maxScrollExtent：最大可滚动长度。
                  extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
                  extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
                  extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
                  atEdge：是否滑到了Scrollable Widget的边界（此示例中相当于列表顶或底部）。*/
                  double progress = notification.metrics.pixels /
                      notification.metrics.maxScrollExtent;
                  setState(() {
                    _progress = "${(progress * 100).toInt()}%";
                  });
                },
                child: ListView.separated(
                  controller: _controller,
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    int ix = index % 5 + 1;
                    return Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/image$ix.jpeg",
                            width: 200,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "   Item Position :   $index",
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return new Divider(
                      color: Colors.lightBlue,
                      height: 1,
                    );
                  },
                ),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: RaisedButton(
                    onPressed: () {
                      _controller.animateTo(500,
                          duration: Duration(milliseconds: 1200),
                          curve: Curves.easeOutCubic);
                    },
                    child: Text("跳转到5 item"),
                  )),
              Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent,Colors.transparent, Colors.lightBlue],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    child: Text(
                      "监听滑动\n $_progress",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
      floatingActionButton: hasScrollTopBtn
          ? new FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              })
          : null,
    );
  }
}
