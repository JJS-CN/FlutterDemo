import 'package:flutter/material.dart';

class CustomWidgetRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("自定义Widget"),
        ),
        body: _CwidgetRouteDemo());
  }
}

class _CwidgetRouteDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CwidgetRouteState();
  }
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _CwidgetRouteState extends State<_CwidgetRouteDemo> {
  double _turns = .0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "自定义Widget方法简介",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "自定义Widget有三种方式：通过组合其它Widget、自绘和实现RenderObject；后两者本质是一样的：通过Canvas和paint进行自己控制\n"),
            TurnBox(
              turns: _turns,
              speed: 1000,
              child: Icon(
                Icons.refresh,
                size: 50,
              ),
            ),
            GradientButton(
              colors: [Colors.orange, Colors.red],
              height: 50.0,
              child: Text("点击控制顺时针旋转2圈"),
              onTap: () {
                setState(() {
                  _turns += 2.0;
                });
              },
            ),
            Text(
              "组合Widget",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "上面两个控件都是通过组合优化widget来实现效果，注意必要参数要用@required 标注，使用assert断言函数来完善控件\n"),
            Text(
              "CustomPaint与Canvas",
              style: TextStyle(fontSize: 20),
            ),
            Text("自绘和实现RenderObject都是通过Canvas和paint进行自己控制绘制逻辑；\n"
                "在Flutter中，提供了一个CustomPaint Widget，它可以结合一个画笔CustomPainter来实现绘制自定义图形。"),
            Text(
              "CustomPaint",
              style: TextStyle(fontSize: 20),
            ),
            Text("构造函数如下：\n"
                "painter: 背景画笔，会显示在子节点后面;\n"
                "foregroundPainter: 前景画笔，会显示在子节点前面\n"
                "size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。\n"
                "isComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。\n"
                "willChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。"),
          ]),
    ));
  }
}

class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.onTap,
    @required this.child,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final Widget child;

  //点击回调
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    //确保colors数组不空
    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TurnBox extends StatefulWidget {
  const TurnBox(
      {Key key,
      this.turns = .0, //旋转的“圈”数,一圈为360度，如0.25圈即90度
      this.speed = 200, //过渡动画执行的总时长
      this.child})
      : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    //旋转角度发生变化时执行过渡动画
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(milliseconds: widget.speed ?? 200),
        curve: Curves.easeOut,
      );
    }
  }
}
