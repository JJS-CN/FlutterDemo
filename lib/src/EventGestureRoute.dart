import 'package:flutter/material.dart';

class EventGestureRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("原始指针与手势"),
        ),
        body: _EventDemo());
  }
}

class _EventDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EventDemoState();
  }
}

class _EventDemoState extends State<_EventDemo> {
  PointerEvent _event;
  String _mGesTouchText;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text("原始指针事件(Pointer Event，在移动设备上通常为触摸事件)相当于TouchEvent，但要更丰富；\n"
              "当指针按下时，Flutter会对应用程序执行命中测试(Hit Test)，以确定指针与屏幕接触的位置存在哪些widget；"
              "后续的事件将会分发到命中的最内部widget进行向上冒泡。\n"
              "只有通过命中测试的Widget才能触发事件。\n\n"
              "Flutter中可以使用Listener widget来监听原始触摸事件，它也是一个功能性widget。\n"
              "当触发指针事件时，参数PointerDownEvent、PointerMoveEvent、PointerUpEvent都是PointerEvent的一个子类\n"
              "position：它是鼠标相对于当对于屏幕的坐标偏移。\n"
              "delta：两次指针移动事件（PointerMoveEvent）的距离。\n"
              "pressure：按压力度，如果手机屏幕支持压力传感器(如iPhone的3D Touch)，此属性会更有意义，如果手机不支持，则始终为1。\n"
              "orientation：指针移动方向，是一个角度值。\n"
              "behavior：它决定子Widget如何响应命中测试。有三个枚举值：\n"
              "HitTestBehavior.deferToChild：默认，对widget一个个命中测试，命中成功即返回\n"
              "HitTestBehavior.translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件\n"
              "HitTestBehavior.opaque：在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，相当于当前Widget的整个区域都是点击区域。\n\n"
              "假如我们不想让某个子树响应PointerEvent的话!!!!\n"
              "我们可以使用IgnorePointer和AbsorbPointer,AbsorbPointer本身会参与命中测试，而IgnorePointer本身不会参与\n"),
          Listener(
            child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              width: 300.0,
              height: 150.0,
              child: Text(_event?.toString() ?? "",
                  style: TextStyle(color: Colors.white)),
            ),
            onPointerDown: (PointerDownEvent event) =>
                setState(() => _event = event),
            onPointerMove: (PointerMoveEvent event) =>
                setState(() => _event = event),
            onPointerUp: (PointerUpEvent event) =>
                setState(() => _event = event),
          ),
          Text(
              "GestureDetector是一个用于手势识别的功能性Widget，我们通过它可以来识别各种手势，它实际是指针事件的语义化封装\n"
              "当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时来确定是否为双击事件。"
              "如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。\n\n"
              "其它手势：onPanDown: (DragDownDetails e)、onPanUpdate: (DragUpdateDetails e)、onPanEnd: (DragEndDetails e)、"
              "onVerticalDragUpdate: (DragUpdateDetails details)、onScaleUpdate: (ScaleUpdateDetails details)\n"
              "参数：DragDownDetails.globalPosition ：当用户按下时，此属性为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移。\n"
              "DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。\n"
              "DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），根据用户抬起手指时的速度做一个减速动画。\n\n"
              "GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的，本质通过Listener来将原始指针事件转换为语义手势;\n"
              "例如：富文本（RichText）的TextSpan并不是一个Widget，但可使用recognizer属性TapGestureRecognizer()来实现点击效果；\n"
              "注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。\n\n"
              "手势竞争(Arena)：如果同时监听水平和垂直方向的拖动事件,斜着拖动时取决于第一次移动时两个轴上的位移分量，哪个轴的大，哪个轴在本次滑动事件竞争中就胜出。"
              "一旦某个方向“获胜”，则直到当次拖动手势结束都会沿着该方向移动。\n\n"
              "手势冲突：假设有一个widget，它可以左右拖动，现在我们也想检测在它上面手指按下和抬起的事件;但只触发了（down和 onHorizontalDragEnd）"
              "我们发现没有打印up，这是因为在拖动时，刚开始按下手指时在没有移动时，拖动手势还没有完整的语义，"
              "此时TapDown手势胜出(win)，此时打印down，而拖动时，拖动手势会胜出，"
              "当手指抬起时，onHorizontalDragEnd 和 onTapUp发生了冲突，但是因为是在拖动的语义中，"
              "所以onHorizontalDragEnd胜出，所以就会打印 onHorizontalDragEnd。\n"
              "实际例子：轮播图实现了拖动，又想增加按下与抬起监听。这时候通过Listener监听原始事件自行处理手势"),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 20),
              width: 300,
              height: 160,
              color: Colors.lightBlueAccent,
              child: Text(
                _mGesTouchText ?? "",
                style: TextStyle(color: Colors.white),
              ),
            ),
            onTap: () {
              setState(() {
                _mGesTouchText = "单击Tap";
              });
            },
            onDoubleTap: () {
              setState(() {
                _mGesTouchText = "双击DoubleTap";
              });
            },
            onLongPress: () {
              setState(() {
                _mGesTouchText = "长按LongPress";
              });
            },
          )
        ],
      ),
    );
  }
}
