import 'package:flutter/material.dart';
import 'package:Flutter_Learn/src/Const.dart';
import 'src/ThemeInheritedRoute.dart';
import 'src/EventGestureRoute.dart';
import 'src/AnimationRoute.dart';
import 'src/CustomWidgetRoute.dart';

//程序入口
void main() => runApp(MyApp());
var listName = [
  "带值跳转与回传",
  "本地资源获取",
  "基础控件",
  "布局控件",
  "容器类控件",
  "滚动类控件",
  "主题与数据共享",
  "原始指针与手势",
  "动画",
  "自定义Widget",
  "组合页面效果"
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter_Learn', //系统多任务管理页面显示的名字
        theme: ThemeData(
          primarySwatch: Colors.deepOrange, //状态栏颜色
        ),
        routes: MyRoutes,
        /** 这里直接使用Scaffold将会报错，出现跳转无效等情况，所以需要如此包一层*/
        home: SplashPage());
  }
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("导航"),
      ),
      body: ListView.separated(
        itemCount: listName.length,
        itemBuilder: (BuildContext con, int index) {
          return GestureDetector(
            child: ListTile(
              title: Text(listName[index]),
            ),
            onTap: () {
              if (listName[index] == "带值跳转与回传") {
                /** 进行带值传递,并监听回传的值.. 通过then函数执行一步监听返回值 */
                Navigator.pushNamed(context, RouteKey_IntentData,
                        arguments: "黑衣剑客桐人")
                    .then((resultValue) {
                  /*弹窗显示返回的数据*/
                  _showResultDialog(context, resultValue);
                });

                //另一种简单跳转方式
                /*Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new IntentRoute()));*/
              } else if (listName[index] == "本地资源获取") {
                Navigator.pushNamed(context, RouteKey_Assets);
              } else if (listName[index] == "基础控件") {
                Navigator.pushNamed(context, RouteKey_SimpleWidget);
              } else if (listName[index] == "布局控件") {
                Navigator.pushNamed(context, RouteKey_LayoutWidgets);
              } else if (listName[index] == "组合页面效果") {
                Navigator.pushNamed(context, RouteKey_ActivitysRoute);
              } else if (listName[index] == "容器类控件") {
                Navigator.pushNamed(context, RouteKey_ContainersWidgets);
              } else if (listName[index] == "主题与数据共享") {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new ThemeTestRoute()));
              } else if (listName[index] == "原始指针与手势") {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new EventGestureRoute()));
              } else if (listName[index] == "动画") {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new AnimationRoute()));
              } else if (listName[index] == "自定义Widget") {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new CustomWidgetRoute()));
              } else if (listName[index] == "滚动类控件") {
                Navigator.pushNamed(context, RouteKey_ScrollWidgets);
              }
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.redAccent,
          );
        },
      ),
    );
  }
}

void _showResultDialog(BuildContext context, var resultValue) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("返回的结果"),
          content: Text(
            resultValue,
            style: TextStyle(fontSize: 20, color: Colors.pink),
          ),
          actions: <Widget>[
            Padding(
              padding: new EdgeInsets.all(1.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确定",
                    style: TextStyle(
                      fontSize: 15,
                    )),
                color: Colors.cyanAccent,
              ),
            )
          ],
        );
      });
}
