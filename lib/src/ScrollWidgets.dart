import 'package:flutter/material.dart';
import 'scroll_widget/SingleChildScrollViewRoute.dart';
import 'scroll_widget/ListViewRoute.dart';
import 'scroll_widget/GridViewRoute.dart';
import 'scroll_widget/CustomScrollViewRoute.dart';
import 'scroll_widget/ScrollControllerRoute.dart';
import 'scroll_widget/InfiniteListViewRoute.dart';
import 'scroll_widget/InfiniteGridViewRoute.dart';

class ScrollWidgetsRoute extends StatelessWidget {
  var widgetList = [
    "SingleChildScrollView",
    "ListView",
    "分页加载ListView",
    "GridView",
    "分页加载GridView",
    "CustomScrollView",
    "滚动与监听与ScrollController"
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
                if (name == "SingleChildScrollView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) =>
                              new SingleChildScrollViewRoute()));
                } else if (name == "ListView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ListViewRoute()));
                } else if (name == "分页加载ListView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new InfiniteListViewRoute()));
                } else if (name == "GridView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new GridViewRoute()));
                }else if (name == "分页加载GridView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new InfiniteGridViewRoute()));
                } else if (name == "CustomScrollView") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new CustomScrollViewRoute()));
                } else if (name == "滚动与监听与ScrollController") {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new ScrollControllerRoute()));
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
