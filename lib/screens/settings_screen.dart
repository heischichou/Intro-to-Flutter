import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/login_screen.dart';

class Settings extends StatelessWidget {
  static const String routeName = '/settings';
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => {
              Navigator.of(context).pushNamedAndRemoveUntil(Login.routeName, (Route<dynamic> route) => false)
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                Text('Settings'),
              ],
            )
          )
          ),
      ),
    );
  }
}