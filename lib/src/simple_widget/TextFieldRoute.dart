import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("输入框与表单的使用"),
        ),
        body: _bo());
  }
}

//body再包含StatefulWidget
class _bo extends StatefulWidget {
  @override
  _FieldState createState() {
    // TODO: implement createState
    return new _FieldState();
  }
}

class _FieldState extends State<_bo> {
  bool _showPassword = true;
  TextEditingController _PasswordController = new TextEditingController();
  String _ErrorStr = "您输入的密码不正确，请输入8位数";
  String _helperStr = "只能输入8位数的英文和数字哦";
  String _pwdValue = "";
  String _helperStrSuccess = "验证成功！！！ 现在的值为：";
  int _inputState = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _PasswordController.text = "23456";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                labelText: "密码",
                contentPadding: EdgeInsets.all(10),
                labelStyle: TextStyle(color: Colors.blue),
                hintText: "请输入密码",
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.remove_red_eye,
                    color: _showPassword ? Colors.blue : Colors.grey,
                  ),
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                errorText: _inputState == 2 ? _ErrorStr : null,
                helperStyle: TextStyle(
                    color: _inputState == 0 ? Colors.grey : Colors.green),
                helperText: _inputState == 0
                    ? _helperStr
                    : _inputState == 1 ? _helperStrSuccess + _pwdValue : ""),
            maxLength: 8,
            textAlign: TextAlign.left,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            autofocus: true,
            controller: _PasswordController,
            onSubmitted: (val) {
              //点击键盘submit按钮触发
              setState(() {
                _inputState = val.length == 0 ? 0 : val.length == 8 ? 1 : 2;
                _pwdValue = val;
              });
            },
            obscureText: !_showPassword,
            cursorColor: Colors.red,
            inputFormatters: [
              WhitelistingTextInputFormatter(RegExp("[a-z,0-9]")),
              LengthLimitingTextInputFormatter(8)
            ],
          ),
          Text("\nTextField本身的属性\n "
              "    TextField({\n "
              "    this.controller,    //编辑框的控制器，赋值与取值都可由他操作\n "
              "    this.focusNode,  //用于管理焦点\n "
              "    this.decoration = const InputDecoration(),   //输入框的装饰器，用来修改外观\n "
              "    this.keyboardType,  //设置输入类型,下面列举常用的键盘类型\n"
              "           TextInputType.number 数字键盘带标点\n"
              "           TextInputType.datetime 单纯数字\n "
              "           TextInputType.emailAddress/url 英文键盘\n "
              "           TextInputType.text 默认键盘\n "
              "           TextInputType.phone 数字键盘，带+;*#等特殊符号\n "
              "    this.textInputAction,   //用于控制键盘动作（默认是完成）\n "
              "           TextInputAction.next、TextInputAction.go、TextInputAction.join 等\n "
              "    this.textCapitalization = TextCapitalization.none,\n "
              "    this.style,    //输入的文本样式\n "
              "    this.textAlign = TextAlign.start,   //输入的文本位置\n "
              "    this.textDirection,    //输入的文字排列方向，一般不会修改这个属性\n "
              "    this.autofocus = false,   //是否自动获取焦点，为true时自动弹出软键盘\n "
              "    this.obscureText = false,   //是否隐藏输入的文字，一般用在密码输入框中\n "
              "    this.autocorrect = true,   //是否自动校验,暂不知效果\n "
              "    this.maxLines = 1,   //最大行\n "
              "    this.maxLength,   //最大字符长度，但在右下角会出现计数。可使用LengthLimitingTextInputFormatter规避达到同样效果,注意需要导入services包\n "
              "    this.maxLengthEnforced = true,  //配合maxLength一起使用，在达到最大长度时是否阻止输入\n "
              "    this.onChanged,  //输入文本发生变化时的回调\n "
              "    this.onEditingComplete,   //点击键盘完成按钮时触发的回调，该回调没有参数，(){}\n "
              "    this.onSubmitted,  //同样是点击键盘完成按钮时触发的回调，该回调有参数，参数即为当前输入框中的值。(String){}\n "
              "    this.inputFormatters,   //对输入文本的校验\n "
              "    this.enabled,    //输入框是否可用\n "
              "    this.cursorWidth = 2.0,  //光标的宽度\n "
              "    this.cursorRadius,  //光标的圆角\n "
              "    this.cursorColor,  //光标的颜色\n "
              "    this.keyboardAppearance,\n "
              "    this.scrollPadding = const EdgeInsets.all(20.0),\n "
              "    this.dragStartBehavior = DragStartBehavior.down,\n "
              "    this.enableInteractiveSelection,\n "
              "    this.onTap,    //点击输入框时的回调(){}\n "
              "    this.buildCounter,\n "
              "    })\n "),
          TextField(
            decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入",
                prefixIcon: Icon(Icons.account_circle),
                icon: Icon(Icons.account_circle),
                helperText: "只能输入英文和数字哦",
                prefix: Container(
                  child: Row(
                    children: <Widget>[
                      Text("U"),
                      Icon(
                        Icons.account_circle,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  width: 40,
                ),
                suffixText: "User",
                filled: true,
                fillColor: Colors.greenAccent,
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(),
                errorText: "error"),
          ),
          Text("\nTextField另一个参数为InputDecoration输入装饰器\n "
              "   因为边框颜色值使用主题色，所以自定义时需要在外层包裹Theme控件，改变ThemeData来实现。如果还需要更彻底的改变背景，请包裹Container来实现吧\n\n"
              "InputDecoration({\n"
              "    this.icon,    //位于装饰器外部和输入框前面的图片\n"
              "    this.labelText,  //用于描述输入框，例如这个输入框是用来输入用户名还是密码的，当输入框获取焦点时默认会浮动到上方，\n"
              "    this.labelStyle,  // 控制labelText的样式,接收一个TextStyle类型的值\n"
              "    this.helperText, //辅助文本，位于输入框下方，如果errorText不为空的话，则helperText不会显示\n"
              "    this.helperStyle, //helperText的样式\n"
              "    this.hintText,  //提示文本，位于输入框内部\n"
              "    this.hintStyle, //hintText的样式\n"
              "    this.hintMaxLines, //提示信息最大行数\n"
              "    this.errorText,  //错误信息提示，只要设置内容不为空，将覆盖helperText进行展示，同时border颜色相应变化\n"
              "    this.errorStyle, //errorText的样式\n"
              "    this.errorMaxLines,   //errorText最大行数\n"
              "    this.hasFloatingPlaceholder = true,  //labelText是否浮动，默认为true，修改为false则labelText在输入框获取焦点时不会浮动且不显示\n"
              "    this.isDense,   //改变输入框是否为密集型，默认为false，修改为true时，图标及间距会变小\n"
              "    this.contentPadding, //内间距，默认Top和Bottom为8\n"
              "    this.prefixIcon,  //位于输入框内部起始位置的图标。\n"
              "    this.prefix,   //预先填充的Widget,跟prefixText同时只能出现一个\n"
              "    this.prefixText,  //预填充的文本，例如手机号前面预先加上区号等\n"
              "    this.prefixStyle,  //prefixText的样式\n"
              "    this.suffixIcon, //位于输入框后面的图片,例如一般输入框后面会有个眼睛，控制输入内容是否明文\n"
              "    this.suffix,  //位于输入框尾部的控件，同样的不能和suffixText同时使用\n"
              "    this.suffixText,//位于尾部的填充文字\n"
              "    this.suffixStyle,  //suffixText的样式\n"
              "    this.counter,//位于输入框右下方的小控件，不能和counterText同时使用\n"
              "    this.counterText,//位于右下方显示的文本，常用于显示输入的字符数量\n"
              "    this.counterStyle, //counterText的样式\n"
              "    this.filled,  //如果为true，则输入使用fillColor指定的颜色填充\n"
              "    this.fillColor,  //相当于输入框的背景颜色\n"
              "    this.errorBorder,   //errorText不为空，输入框没有焦点时要显示的边框\n"
              "    this.focusedBorder,  //输入框有焦点时的边框,如果errorText不为空的话，该属性无效\n"
              "    this.focusedErrorBorder,  //errorText不为空时，输入框有焦点时的边框\n"
              "    this.disabledBorder,  //输入框禁用时显示的边框，如果errorText不为空的话，该属性无效\n"
              "    this.enabledBorder,  //输入框可用时显示的边框，如果errorText不为空的话，该属性无效\n"
              "    this.border, //正常情况下的border\n"
              "    this.enabled = true,  //输入框是否可用\n"
              "    this.semanticCounterText,\n"
              "    this.alignLabelWithHint,\n"
              "    })\n"),
        ],
      ),
    );
  }
}
