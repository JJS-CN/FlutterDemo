import 'package:flutter/material.dart';
var pushValue = "";
var resultValue = "闪光的亚斯娜";

class IntentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    pushValue = ModalRoute.of(context).settings.arguments;
    /** WillPopScope 用于拦截所有的返回操作。包括物理和系统返回 */
    return new WillPopScope(
        child: new Scaffold(
            appBar: AppBar(
              title: Text(
                "带值传递",
              ),
            ),
            body: _Body()),
        onWillPop: () async {
          /** 这里返回false以禁用 */
          _showDialog(context);
          return false;
        });
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement createElement
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("接受到的值为："),
              Text(pushValue, style: TextStyle(fontSize: 18))
            ],
          ),
          Row(
            children: <Widget>[
              Text("并准备回传的值："),
              Text(resultValue,
                  style: TextStyle(fontSize: 18, color: Colors.pink))
            ],
          )
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) =>
          new AlertDialog(content: Text("拦截返回。点击确认退出当前页面"), actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(_);
                  Navigator.pop(_, resultValue);
                },
                child: Text("确定"))
          ]));
}
