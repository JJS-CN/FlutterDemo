import 'package:flutter/material.dart';

class AnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("动画"),
        ),
        body: _AnimationRouteDemo());
  }
}

class _AnimationRouteDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimationRouteState();
  }
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _AnimationRouteState extends State<_AnimationRouteDemo>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation, _animation2, _animation3;

  bool isForg = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation =
        new Tween(begin: 20.0, end: 300.0).animate(_animationController)
          ..addListener(() {
            setState(() => {});
          });

    _animation2 =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);
    _animation2 = new Tween(begin: 20.0, end: 300.0).animate(_animation2)
      ..addListener(() {
        setState(() => {});
      });
    _animation3 = CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut);
    _animation3 = new Tween(begin: 180.0, end: 300.0).animate(_animation3)
      ..addListener(() {
        setState(() => {});
      });
    //启动动画(正向执行)
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
              "Animation",
              style: TextStyle(fontSize: 20),
            ),
            Text("Animation是一个抽象类，它用于保存动画的插值和状态；"
                "是一个在一段时间内依次生成一个区间(Tween)之间值的类。"
                "Animation对象的输出值可以是线性的、曲线的、一个步进函数或者任何其他曲线函数。"
                "根据Animation对象的控制方式，动画可以反向运行，甚至可以在中间切换方向\n"),
            Text(
              "动画的帧和状态变化监听",
              style: TextStyle(fontSize: 20),
            ),
            Text("我们可以通过Animation来监听动画的帧和状态变化：\n"
                "addListener()可以给Animation添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建。\n"
                "addStatusListener()可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用StatusListener。\n"),
            Text(
              "Curve",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "Flutter中通过Curve（曲线）来描述动画过程，Curve可以是线性的(Curves.linear)，也可以是非线性的。\n"
                "CurvedAnimation和AnimationController都是Animation类型。CurvedAnimation可以通过包装AnimationController和Curve生成一个新的动画对象 。\n"),
            Text(
              "AnimationController",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "AnimationController用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法。\n"
                "AnimationController.duration：动画执行时间。\n"
                "AnimationController.lowerBound：动画值的下界，默认0.0\n"
                "AnimationController.upperBound：动画值的上界，默认1.0\n"
                "AnimationController.vsync：Ticker ；详解下方   一般通过将SingleTickerProviderStateMixin添加到State的定义中，然后将State对象作为vsync的值\n"),
            Text(
              "Ticker",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "当创建一个AnimationController时，需要传递一个vsync参数，它接收一个TickerProvider类型的对象，它的主要职责是创建Ticker。\n"
                "Flutter应用在启动时都会绑定一个SchedulerBinding，"
                "通过SchedulerBinding可以给每一次屏幕刷新添加回调，而Ticker就是通过SchedulerBinding来添加屏幕刷新回调，"
                "这样一来，每次屏幕刷新都会调用TickerCallback。"
                "使用Ticker(而不是Timer)来驱动动画会防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源，"
                "因为Flutter中屏幕刷新时会通知到绑定的SchedulerBinding，而Ticker是受SchedulerBinding驱动的，"
                "由于锁屏后屏幕会停止刷新，所以Ticker就不会再触发。\n"),
            Text(
              "Tween",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "默认情况下，AnimationController对象值的范围是0.0到1.0。但可以使用Tween来配置动画以生成不同的范围或数据类型的值。Tween构造函数需要begin和end两个参数。\n"
                "Tween继承自Animatable，而不是继承自Animation。Animatable与Animation相似，不是必须输出double值。例如，ColorTween指定两种颜色之间的过渡。\n"
                "Tween对象不存储任何状态，相反，它提供了evaluate(Animation<double> animation)方法，它可以获取动画当前值。 Animation对象的当前值可以通过value()方法取到。"
                "evaluate函数还执行一些其它处理，例如分别确保在动画值为0.0和1.0时返回开始和结束状态。\n"
                "要使用Tween对象，需要调用其animate()方法，然后传入一个控制器对象。animate()返回的是一个Animation\n"),
            GestureDetector(
              onTap: () {
                //可以通过指定  _animationController.forward(from: 0); 来从头开始，否则默认为1
                startAnim();
              },
              child: Container(
                color: Colors.red,
                width: _animation.value,
                height: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                //可以通过指定  _animationController.forward(from: 0); 来从头开始，否则默认为1
                /*if (isForg)
                      _animationController2.forward();
                    else
                      _animationController2.reverse();
                    isForg = !isForg;*/
                startAnim();
              },
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.red,
                width: _animation2.value,
                height: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                startAnim();
              },
              child: GrowTransition(
                animation: _animation3,
                child: Container(
                  color: Colors.lightBlue,
                  child: Text("用AnimatedBuilder重构"),
                ),
              ),
            ),
            Text(
                "我们在使用动画时最好做一定程度的封装，将child和animation抽象出来动态设置，内部使用AnimatedBuilder进行构建动画。\n"
                "这有以下好处:\n"
                "1:不用显式的去添加帧监听器，然后再调用setState() 了，这个好处和AnimatedWidget是一样的。\n"
                "2:由于使用AnimatedBuilder进行构建，在刷新时只会刷新本widget，而不会触发全局的build刷新，所以效率会提高。\n"
                "3:通过AnimatedBuilder可以封装常见的过渡效果来复用动画。\n"),
            Text(
              "动画状态监听",
              style: TextStyle(fontSize: 20),
            ),
            Text("我们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器。\n"
                "有4种枚举值：\n"
                "dismissed	动画在起始点停止\n"
                "forward	动画正在正向执行\n"
                "reverse	动画正在反向执行\n"
                "completed	动画在终点停止\n"),
            Text(
              "自定义路由切换动画",
              style: TextStyle(fontSize: 20),
            ),
            Text("我们使用的路由都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装。\n"
                "我们优先使用PageRouteBuilder来构建路由动画；但假如返回时不需要过渡动画，就只能通过继承PageRoute的方式了；\n"
                "使用：PageRouteBuilder>pageBuilder  或PageRoute>buildTransitions 中返回动画Animation；"),
            Text(
              "Hero动画（页面间元素共享动画）",
              style: TextStyle(fontSize: 20),
            ),
            Text(
                "实现Hero动画只需要用Hero Widget将要共享的Widget包装起来，并提供一个相同的tag即可，中间的过渡帧都是Flutter Framework自动完成的。真的非常简单！"),
            Text(
              "交错动画",
              style: TextStyle(fontSize: 20),
            ),
            Text("有些时候我们可能会需要一些复杂的动画，可能由一个动画序列或重叠的动画组成。交错动画需要注意以下几点：\n"
                "1:要创建交错动画，需要使用多个动画对象\n"
                "2:一个AnimationController控制所有动画\n"
                "3:给每一个动画对象指定间隔（Interval）\n"
                "所有动画都由同一个AnimationController驱动，无论动画实时持续多长时间，控制器的值必须介于0.0和1.0之间，而每个动画的间隔（Interval）介于0.0和1.0之间。"
                "对于在间隔中设置动画的每个属性，请创建一个Tween。 Tween指定该属性的开始值和结束值。"
                "也就是说0.0到1.0代表整个动画过程，我们可以给不同动画指定起始点和终止点来决定它们的开始时间和终止时间。\n"
                "还是使用AnimatedBuilder进行抽象，并对每一个动画设置Interval，具体百度查看demo"),
          ]),
    ));
  }

  void startAnim() {
    if (isForg) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isForg = !isForg;
  }

  dispose() {
    //路由销毁时需要释放动画资源
    _animationController.dispose();
    super.dispose();
  }
}

//用AnimatedBuilder重构
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return new Container(
                margin: EdgeInsets.only(top: 10),
                height: 30,
                width: animation.value,
                child: child);
          },
          child: child),
    );
  }
}
