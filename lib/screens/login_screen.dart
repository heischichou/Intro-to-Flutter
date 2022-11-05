import 'package:flutter/material.dart';
import '../models/user.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User> _users = [];

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Text('Dashboard'),
        )
      ),
    );
  }
}
