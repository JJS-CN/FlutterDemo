import 'package:Flutter_Learn/src/RouteIntent.dart';
import 'package:Flutter_Learn/src/Assets.dart';
import 'package:Flutter_Learn/src/ContainersWidgets.dart';
import 'package:Flutter_Learn/src/SimpleWidget.dart';
import 'package:Flutter_Learn/src/simple_widget/TextRoute.dart';
import 'package:Flutter_Learn/src/simple_widget/ButtonRoute.dart';
import 'package:Flutter_Learn/src/simple_widget/ImageRoute.dart';
import 'package:Flutter_Learn/src/simple_widget/SelectBoxRoute.dart';
import 'package:Flutter_Learn/src/simple_widget/TextFieldRoute.dart';
import 'package:Flutter_Learn/src/LayoutWidgets.dart';
import 'package:Flutter_Learn/src/layout_widgets/RowColumRoute.dart';
import 'package:Flutter_Learn/src/layout_widgets/FlexRoute.dart';
import 'package:Flutter_Learn/src/layout_widgets/WrapFlowRoute.dart';
import 'package:Flutter_Learn/src/layout_widgets/StackPositionedRoute.dart';
import 'package:Flutter_Learn/src/Activitys.dart';
import 'package:Flutter_Learn/src/activity/HomeActivity.dart';
import 'ScrollWidgets.dart';

//key 定义页面跳转的标识，需要唯一
var RouteKey_IntentData = "/RouteKey_IntentData";
var RouteKey_Assets = "/RouteKey_Assets";

var RouteKey_SimpleWidget = "/RouteKey_SimpleWidget";
var RouteKey_TextRoute = "/RouteKey_TextRoute";
var RouteKey_ButtonRoute = "/RouteKey_ButtonRoute";
var RouteKey_ImageRoute = "/RouteKey_ImageRoute";
var RouteKey_SelectBoxRoute = "/RouteKey_SelectBoxRoute";
var RouteKey_TextFieldRoute = "/RouteKey_TextFieldRoute";

var RouteKey_LayoutWidgets = "/RouteKey_LayoutWidgets";
var RouteKey_RowColumRoute = "/RouteKey_RowColumRoute";
var RouteKey_FlexRoute = "/RouteKey_FlexRoute";
var RouteKey_WrapFlowRoute = "/RouteKey_WrapFlowRoute";
var RouteKey_StackPositionedRoute = "/RouteKey_StackPositionedRoute";
var RouteKey_ActivitysRoute = "/RouteKey_ActivitysRoute";
var RouteKey_HomeActivityRoute = "/RouteKey_HomeActivityRoute";

var RouteKey_ContainersWidgets = "/RouteKey_ContainersWidgets";
var RouteKey_ScrollWidgets = "/RouteKey_ScrollWidgets";



//所有路由的注册
var MyRoutes = {
  RouteKey_IntentData: (_) => IntentRoute(),
  RouteKey_Assets: (_) => AssetsRoute(),
  RouteKey_SimpleWidget: (_) => SimpleWidgetListRoute(),
  RouteKey_TextRoute: (_) => TextRoute(),
  RouteKey_ButtonRoute: (_) => ButtonRoute(),
  RouteKey_ImageRoute: (_) => ImageRoute(),
  RouteKey_SelectBoxRoute: (_) => SelectBoxRoute(),
  RouteKey_TextFieldRoute: (_) => TextFieldRoute(),
  RouteKey_LayoutWidgets: (_) => LayoutWidgetsRoute(),
  RouteKey_RowColumRoute: (_) => RowColumRoute(),
  RouteKey_FlexRoute: (_) => FlexRoute(),
  RouteKey_WrapFlowRoute: (_) => WrapFlowRoute(),
  RouteKey_StackPositionedRoute: (_) => StackPositionedRoute(),
  RouteKey_ActivitysRoute: (_) => ActivitysRoute(),
  RouteKey_HomeActivityRoute: (_) => HomeActivityRoute(),
  RouteKey_ContainersWidgets: (_) => ContainersWidgets(),
  RouteKey_ScrollWidgets: (_) => ScrollWidgetsRoute(),

};
