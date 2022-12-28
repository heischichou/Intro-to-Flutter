import 'package:flutter/material.dart';
import 'package:flutter_intro/screens/login_screen.dart';
import 'package:flutter_intro/services/auth_service.dart';
import 'package:flutter_intro/services/storage_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final AuthService authService = AuthService();
  final SecureStorage _storageService = SecureStorage();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              logout();
              Navigator.of(context).pushNamedAndRemoveUntil(
                Login.routeName, (Route<dynamic> route) => false
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
      ),
    );
  }

  logout() async {
    try {
      setState(() {
        showSpinner = true;
      });

      await authService.logout();
      await _storageService.deleteAll();

      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
