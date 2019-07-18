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

class _AnimationRouteState extends State<_AnimationRouteDemo>
    with SingleTickerProviderStateMixin {
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
          ]),
    ));
  }
}
