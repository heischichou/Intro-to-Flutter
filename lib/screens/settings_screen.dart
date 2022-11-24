import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/login_screen.dart';
import 'package:flutter_intro/services/auth_service.dart';

class Settings extends StatelessWidget {
  AuthService authService = AuthService();
  static const String routeName = '/settings';
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Login.routeName, (Route<dynamic> route) => false
              )
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  logout() async {
    try {
      await authService.logout();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
