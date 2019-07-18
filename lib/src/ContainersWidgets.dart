import 'package:flutter/material.dart';

class ContainersWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("容器类控件的使用"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Padding控件",
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
              Text("Padding可以给其子节点添加补白（填充）"),
              _getRow(
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      color: Colors.red,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  "Padding:EdgeInsets.all(5) / Container w和h:30效果"),
              _getRow(
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.red,
                      width: 30,
                      height: 30,
                    ),
                  ),
                  "Padding:EdgeInsets.all(10) / Container w和h:30效果"),
              _getRow(
                  Container(
                    color: Colors.red,
                    child: Padding(padding: EdgeInsets.all(20)),
                  ),
                  "Container 外层色块，Padding:EdgeInsets.all(20) 效果"),
              Text("通过上面对比，可知padding无法增大点击区域，可视为margin使用。"
                  "要想增大，需要将作用对象视为父类考虑"),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "EdgeInsets",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Text("EdgeInsets是EdgeInsetsGeometry的实现子类，定义了一些设置补白的便捷方法，\n"
                  "fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白,需要同时设置4个参数\n\n"
                  "all(double value) : 所有方向均使用相同数值的补白。\n\n"
                  "only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。但需要手动打出left等参数名only({left:30,top:10 })\n\n"
                  "symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。\n"),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "ConstrainedBox和SizedBox",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Text(
                  "ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的。SizedBox只是ConstrainedBox的一个定制"),
              _getRow(
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width: 50, height: 20),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.red,
                    ),
                  ),
                  "ConstrainedBox 设置限定w 50、h 20，Container 设置w 30、h 30，实际显示为w 50 h20"),
              Text(
                  "\n在有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。\n"),
              Text(
                  "另：多重限制时，中间插入UnconstrainedBox可以去除父限制，但父限制实际仍会作用于UnconstrainedBox，所以可能会有空白占位，而child会根据子限制进行绘制\n"),
              Text(
                "无法彻底去除父BoxConstraints的限制！！！所以如果我们设置SizedBox而无效时，很可能已经有一个父限制了，所以可以先包一层UnconstrainedBox去除父限制\n\n",
                style: TextStyle(color: Colors.red),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "DecoratedBox和BoxDecoration",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Text(
                  "DecoratedBox可以在其子widget绘制前(或后)绘制一个装饰Decoration；BoxDecoration是具体实现子类\n"),
              Text(
                  "DecoratedBox.decoration   通常接收BoxDecoration子类，实现了常用的装饰元素的绘制\n"
                  "DecoratedBox.position   background：背景装饰；foreground：前景装饰。\n"
                  "子类BoxDecoration 参数复杂，使用时再单独学习\n"),
              _getRow(
                  DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.red, Colors.orange[700]]), //背景渐变
                          borderRadius: BorderRadius.circular(3.0), //3像素圆角
                          boxShadow: [
                            //阴影
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(2.0, 2.0),
                                blurRadius: 4.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.0, vertical: 10.0),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  "通过DecoratedBox和BoxDecoration绘制一个背景装饰"),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Container",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
              Text(
                  "容器的大小可以通过width、height属性来指定，也可以通过constraints来指定，如果同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。\n"
                  "color和decoration是互斥的，实际上，当指定color时，Container内会自动创建一个decoration。\n"
                  "它也有margin和padding属性，效果与安卓一致，内部实际都是由Padding控件来实现。margin的Padding在最外层，padding的Padding在内层"),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Transform 矩阵变换",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontStyle: FontStyle.normal),
                ),
              ),
              _getRow(
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 50, bottom: 10),
                    color: Colors.black,
                    child: new Transform(
                      alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                      transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
                      child: new Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Colors.deepOrange,
                        child: const Text('Apartment for rent!'),
                      ),
                    ),
                  ),
                  "Transform 变换是在draw绘制阶段执行，所以控件的大小和实际位置不会改变\n"
                  "如果想在layout测量阶段执行变换，可使用RotatedBox 或其他控件（百度。。。）\n")
            ],
          ),
        ));
  }
}

Widget _getRow(Widget widget, String text) {
  return Container(
    child: Row(
      children: <Widget>[widget, Expanded(child: Text(text))],
    ),
  );
}
