import 'package:flutter/material.dart';

//外层需要是一个StatelessWidget控件
class SelectBoxRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("选择框的使用"),
      ),
      body: _bo(),
    );
  }
}

//body再包含StatefulWidget
class _bo extends StatefulWidget {
  @override
  _SelectBoxRouteState createState() {
    // TODO: implement createState
    return new _SelectBoxRouteState();
  }
}

class _SelectBoxRouteState extends State<_bo> {
  bool _switchEnable = true;
  bool _checkEnable = true;
  List<bool> _checkTileEnalbe = [true, true];
  String _sex = "女";
  String _sex2 = "女";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getRowWidget(
              Column(
                children: <Widget>[
                  Text(_switchEnable ? "打开" : "关闭"),
                  Switch(
                      value: _switchEnable,
                      onChanged: (value) {
                        setState(() {
                          _switchEnable = value;
                        });
                      }),
                ],
              ),
              "Material widgets库中提供了Material风格的单选开关Switch和复选框Checkbox，"
              "它们都是继承自StatelessWidget，所以它们本身不会保存当前选择状态，"
              "所以一般都是在父widget中管理选中状态。当用户点击Switch或Checkbox时，它们会触发onChanged回调，"
              "我们可以在此回调中处理选中状态改变逻辑。"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "activeColor  设置打开状态下圆点的颜色，横条也会对应变化"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  activeTrackColor: Colors.yellow,
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "activeTrackColor  设置打开状态下横条的颜色。圆点默认色"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  inactiveThumbColor: Colors.deepPurpleAccent,
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "inactiveThumbColor  设置关闭状态圆点颜色"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  inactiveTrackColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "inactiveTrackColor  设置关闭状态横条颜色"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  activeThumbImage: AssetImage("assets/image4.jpeg"),
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "activeThumbImage  设置打开状态下圆点上展示图片。默认效果BoxFit.contain进行缩放，建议给予正方形图片"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  inactiveThumbImage: AssetImage("assets/image1.jpeg"),
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "inactiveThumbImage  设置关闭状态下圆点上展示图片"),
          _getRowWidget(
              Switch(
                  value: _switchEnable,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  onChanged: (value) {
                    setState(() {
                      _switchEnable = value;
                    });
                  }),
              "MaterialTapTargetSize  有shrinkWrap和padded 2种取值，padded所占位置更大,暂不清楚其它效果"),
          _getRowWidget(
              Row(
                children: <Widget>[
                  Checkbox(
                      value: _checkEnable,
                      onChanged: (value) {
                        setState(() {
                          _checkEnable = value;
                        });
                      }),
                  Text(
                    _checkEnable ? "同意" : "拒绝",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
              "     复选框CheckBox是无法设置文本的，需要单独拼接Text"),
          _getRowWidget(
              Checkbox(
                  value: _checkEnable,
                  activeColor: Colors.blue,
                  onChanged: (value) {
                    setState(() {
                      _checkEnable = value;
                    });
                  }),
              "activeColor   设置选中后的颜色"),
          _getRowWidget(
              Checkbox(
                  value: _checkEnable,
                  onChanged: (value) {
                    setState(() {
                      _checkEnable = value;
                    });
                  }),
              "tristate   Checkbox的这个属性默认是false,开启时为三态 [ true、false、null ]，暂不清楚应用场景"),
          _getRowWidget(
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Radio(
                          value: "女",
                          groupValue: _sex,
                          onChanged: (sex) {
                            setState(() {
                              _sex = sex;
                            });
                          }),
                      Radio(
                          activeColor: Colors.blue,
                          value: "男",
                          groupValue: _sex,
                          onChanged: (sex) {
                            setState(() {
                              _sex = sex;
                            });
                          })
                    ],
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "选中："),
                    TextSpan(
                        text: _sex,
                        style: TextStyle(
                            color:
                                _sex == "女" ? Colors.deepOrange : Colors.blue)),
                    TextSpan(text: "     ")
                  ]))
                ],
              ),
              "value 为Radio的唯一标识；groupValue 为分组变量，不同radio给予同一个变量将被分组；它们两个匹配时将选中"),
          CheckboxListTile(
              activeColor: Colors.blue,
              controlAffinity: ListTileControlAffinity.platform,
              selected: true,
              title: Text("标题"),
              subtitle: Text("副标题"),
              secondary: Icon(Icons.bookmark),
              value: _checkTileEnalbe[0],
              onChanged: (value) {
                setState(() {
                  _checkTileEnalbe[0] = value;
                });
              }),
          CheckboxListTile(
              activeColor: Colors.blue,
              controlAffinity: ListTileControlAffinity.platform,
              selected: true,
              title: Text("标题"),
              secondary: Icon(Icons.build),
              value: _checkTileEnalbe[1],
              onChanged: (value) {
                setState(() {
                  _checkTileEnalbe[1] = value;
                });
              }),
          Container(
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              child: Text(
                "上面是2个CheckboxListTile，为checkBox的包装类,具有所有CheckBox的属性；这里只说明单独属性 \n"
                "(Switch和Radio也有相同的ListTile！！！！ )\n "
                "controlAffinity  控制图标的位置：trailing 左、leading 右、platform 跟随系统\n"
                "title  标题文本，subtitle副标题文本；其中subtitle将撑大布局\n"
                "selected  默认false，为true时；文字和图片的颜色将应用activeColor的色值",
                textAlign: TextAlign.left,
              )),
          Container(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RadioListTile(
                  selected: true,
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: Icon(Icons.pregnant_woman),
                  value: "女",
                  subtitle: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/image1.jpeg"),
                        width: 25,
                        height: 25,
                        alignment: Alignment.centerLeft,
                      ),
                      Text("副标题")
                    ],
                  ),
                  title: Text("标题"),
                  groupValue: _sex2,
                  onChanged: (sex) {
                    setState(() {
                      _sex2 = sex;
                    });
                  },
                ),
                RadioListTile(
                  selected: true,
                  activeColor: Colors.blue,
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: Icon(Icons.accessibility),
                  value: "男",
                  title: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/image3.jpeg"),
                        height: 40,
                      ),
                      Text(" 标题")
                    ],
                  ),
                  groupValue: _sex2,
                  onChanged: (sex) {
                    setState(() {
                      _sex2 = sex;
                    });
                  },
                )
              ],
            ),
          ),
          SwitchListTile(
              value: _switchEnable,
              title: Text("囊"),
              secondary: Image.asset("assets/image4.jpeg"),
              onChanged: (value) {
                setState(() {
                  _switchEnable = value;
                });
              }),
        ],
      ),
    );
  }
}

Widget _getRowWidget(Widget widget, String message) {
  return Row(
    children: <Widget>[widget, Expanded(child: Text(message))],
  );
}
