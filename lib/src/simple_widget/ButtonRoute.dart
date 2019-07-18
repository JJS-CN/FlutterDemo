import 'package:flutter/material.dart';

class ButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("Button控件的使用"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {
                    _showDialog(context,
                        "RaisedButton 即\"漂浮\"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大\n\n"
                        + "this.elevation = 2.0, //正常状态下的阴影"
                        + "this.highlightElevation = 8.0,//按下时的阴影"
                        + "this.disabledElevation = 0.0,// 禁用时的阴影"
                    )
                  },
              child: Text("RaisedButton"),
            ),
            FlatButton(
                onPressed: () => {
                      _showDialog(
                          context, "FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色")
                    },
                child: Text("FlatButton")),
            IconButton(
                icon: Icon(Icons.access_alarm),
                onPressed: () => {
                      _showDialog(context,
                          "IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景")
                    }),
            OutlineButton(
              onPressed: () => {
                    _showDialog(context,
                        "OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)")
                  },
              child: Text("OutlineButton"),
            ),RaisedButton(
             onPressed: () => {
             _showDialog(
                     context, "@required this.onPressed, //按钮点击回调\n"
                             +"this.textColor, //按钮文字颜色\n"
                             +" this.disabledTextColor, //按钮禁用时的文字颜色\n"
                             +" this.color, //按钮背景颜色\n"
                             +" this.disabledColor,//按钮禁用时的背景颜色\n"
                             +" this.highlightColor, //按钮按下时的背景颜色\n"
                             +" this.splashColor, //点击时，水波动画中水波的颜色\n"
                             +" this.colorBrightness,//按钮主题，默认是浅色主题 \n"
                             +" this.padding, //按钮的填充\n"
                             +" this.shape, //外形\n"
                             +" @required this.child, //按钮的内容\n\n"
                             +" highlightColor 和 splashColor同时存在时，以highlightColor优先"
    )
                 },
            color: Colors.blue,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
            splashColor: Colors.red,
            elevation: 5,
            child:Container(width: 200,child: Text("自定义按钮",textAlign: TextAlign.center,),)),
          ],
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, var resultValue) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text(
            resultValue,
          ),
        );
      });
}
