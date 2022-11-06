import 'package:flutter/material.dart';
import 'package:flutter_intro/routes.dart';
import 'package:flutter_intro/screens/login_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Login.routeName,
    routes: routes,
  ));
}
