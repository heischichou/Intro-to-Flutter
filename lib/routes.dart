import 'package:flutter_intro/screens/login_screen.dart';
import 'package:flutter_intro/screens/signup_screen.dart';
import 'package:flutter_intro/screens/dashboard_screen.dart';
import 'package:flutter_intro/screens/settings_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => const Login(),
  Signup.routeName: (BuildContext context) => const Signup(),
  Dashboard.routeName: (BuildContext context) => const Dashboard(),
  Settings.routeName: (BuildContext context) => Settings(),
};