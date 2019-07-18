import 'package:flutter/material.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                  "InheritedWidget 可以高效的将数据在Widget树中向下传递、共享;(Theme)和Locale(当前语言环境)都是基于此实现的\n"
                  "使用时我们需要继承InheritedWidget，设置要保存的参数并生成一个快捷获取的方法（通过context.inheritFromWidgetOfExactType(NewTestWidget);提供数据）\n"
                  "通过 bool updateShouldNotify(NewTestWidget old) { return old.data != data;}比对是否需要更新数据\n"
                  "使用时，1：在state的build方法中使用 NewTestWidget.of(context).data 方式获取共享数据\n"
                  "2：将新建的InheritedWidget类作为父类，data与外部参数进行绑定，之后通过setState方法更新data绑定的外部值即可刷新所有位置\n"
                  "另：InheritedWidget（依赖）改变时会回调 void didChangeDependencies()方法，需要依赖改变才需昂贵操作时。"
                  "这些操作就可在此进行，避免每次build都执行\n"
                  ""),
            ),
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Theme可以通过局部主题覆盖全局主题,这主要是因为Widget中使用主题样式时是通过Theme.of(BuildContext context)来获取的\n"
                  "内部实现：return context.inheritFromWidgetOfExactType(_InheritedTheme)\n"
                  " 会在widget树中从当前位置向上查找第一个类型为_InheritedTheme的Widget。所以当局部使用Theme后，其子树中Theme.of()找到的第一个_InheritedTheme便是该Theme的。\n"
                  "这里是对单个路由换肤，如果相对整个应用换肤，需要去修改MaterialApp的theme属性。",
                  style: TextStyle(color: _themeColor),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => //切换主题
                setState(() => _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette)),
      ),
    );
  }
}
