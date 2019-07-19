import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:ui';

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

  DateTime datetime;
  Timer timer;

  @override
  void initState() {
    super.initState();
    datetime = DateTime.now();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        datetime = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
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
              "CustomPaint（画布）",
              style: TextStyle(fontSize: 20),
            ),
            Text("构造函数如下：\n"
                "painter: 背景画笔，会显示在子节点后面;\n"
                "foregroundPainter: 前景画笔，会显示在子节点前面\n"
                "size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。\n"
                "isComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。\n"
                "willChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。\n"
                "    painter和foregroundPainter 2个画笔需要继承CustomPainter类；\n"
                "如果：画布需要子节点，请使用RepaintBoundary包裹，因为他会在绘制时创建一个新的绘制层（Layer），其子Widget的绘制将独立于父Widget的绘制，避免子节点不必要的重绘；\n"),
            Text(
              "CustomPainter（作画构建）",
              style: TextStyle(fontSize: 20),
            ),
            Text("CustomPainter中提定义了一个虚函数paint；paint有两个参数:\n"
                "Canvas：一个画布，包括各种绘制方法;\n"
                "Size：当前绘制区域大小。\n"
                "我们通过继承CustomPainter来描述该如何在画布上作画，实际画笔类Paint和画布类Canvas和安卓中无区别；\n"
                "shouldRepaint方法：用来确定是否需要重绘，需要谨慎设置，固定图形请返回false不重绘；\n"
                "对于复杂和大开销绘画，需要尽可能的多分层。将动态与静态内容进行分离；"),
            CustomPaint(
              size: Size(200, 200),
              painter: PainterDemo(datetime),
            )
          ]),
    ));
  }
}

class PainterDemo extends CustomPainter {
  double mCradius = 80;
  DateTime _dateTime;

  PainterDemo(this._dateTime) {}

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var mCLatlng = [size.width / 2, size.height / 2];
    var mPaint = new Paint()
      ..color = Colors.white
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    Path path = new Path();
    path.addOval(new Rect.fromCircle(
        center: new Offset(mCLatlng[0], mCLatlng[1]), radius: mCradius));
    canvas.drawShadow(path, Colors.lightBlue, 4, false);
    canvas.drawCircle(Offset(mCLatlng[0], mCLatlng[1]), mCradius, mPaint);

    List<Offset> secondsOffset = [];
    TextPainter textPainter = new TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    //点半径
    var PotRadius = mCradius - 5;
    for (var i = 0; i < 60; i++) {
      Offset offset = Offset(
          cos(degToRad(6 * i - 90)) * PotRadius + mCLatlng[0],
          sin(degToRad(6 * i - 90)) * PotRadius + mCLatlng[1]);
      secondsOffset.add(offset);
    }
    canvas.save();
    canvas.translate(mCLatlng[0], mCLatlng[1]);

    for (var i = 1; i <= 12; i++) {
      //draw number

      textPainter.text = new TextSpan(
        text: "${(i) == 0 ? "12" : (i.toString())}",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Times New Roman',
          fontSize: 10.0,
        ),
      );

      //helps make the text painted vertically
      //rotate是以弧度为单位的
      canvas.rotate(pi / 6);
      canvas.save();
      canvas.translate(0.0, -mCradius + 15);
      textPainter.layout();
      textPainter.paint(canvas,
          new Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
      canvas.restore();
    }
    canvas.restore();
    //draw second point
    mPaint.color = Colors.black;
    mPaint.strokeCap = StrokeCap.round;
    mPaint.strokeWidth = 2;
    if (secondsOffset.length > 0) {
      canvas.drawPoints(PointMode.points, secondsOffset, mPaint);
    }

    final hour = _dateTime.hour;
    final minute = _dateTime.minute;
    final second = _dateTime.second;
    Offset offsetH = Offset(cos(degToRad(6 * hour - 90)) * 20 + mCLatlng[0],
        sin(degToRad(6 * hour - 90)) * 20 + mCLatlng[1]);
    mPaint.strokeWidth = 5;
    mPaint.color = Colors.black;
    canvas.drawLine(Offset(mCLatlng[0], mCLatlng[1]), offsetH, mPaint);
    Offset offsetM = Offset(cos(degToRad(6 * minute - 90)) * 40 + mCLatlng[0],
        sin(degToRad(6 * minute - 90)) * 40 + mCLatlng[1]);
    mPaint.strokeWidth = 3;
    mPaint.color = Colors.lightBlue;
    canvas.drawLine(Offset(mCLatlng[0], mCLatlng[1]), offsetM, mPaint);
    Offset offsetS = Offset(cos(degToRad(6 * second - 90)) * 55 + mCLatlng[0],
        sin(degToRad(6 * second - 90)) * 55 + mCLatlng[1]);
    mPaint.strokeWidth = 1;
    mPaint.color = Colors.red;
    canvas.drawLine(Offset(mCLatlng[0], mCLatlng[1]), offsetS, mPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

num degToRad(num deg) => deg * (pi / 180.0);

num radToDeg(num rad) => rad * (180.0 / pi);

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
