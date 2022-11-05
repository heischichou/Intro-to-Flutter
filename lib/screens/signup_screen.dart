import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  static const String routeName = '/signup';
  const Signup({super.key});

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
