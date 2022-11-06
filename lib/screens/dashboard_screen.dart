import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/settings_screen.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = '/dashboard';
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => {Navigator.pushNamed(context, Settings.routeName)},
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: const [
                Text('Dashboard'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
