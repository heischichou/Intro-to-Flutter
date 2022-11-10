import 'package:flutter/material.dart';
import 'package:flutter_intro/models/user.dart';
import 'package:flutter_intro/widgets/input_field.dart';
import 'package:flutter_intro/widgets/password_input_field.dart';
import 'package:flutter_intro/widgets/primary_button.dart';
import 'package:flutter_intro/widgets/link.dart';
import 'package:flutter_intro/screens/signup_screen.dart';
import 'package:flutter_intro/screens/dashboard_screen.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<User> _users = [];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: screenWidth * .90,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      "Email Adrdress", 
                      "Enter your email address", 
                      _emailController, 
                      TextInputType.emailAddress
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PasswordInputField(
                      "Password", 
                      "Enter your password", 
                      obscureText, 
                      _passwordController, 
                      TextInputType.visiblePassword,
                      toggleObsecurePassword,
                      null
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    PrimaryButton(
                      "Login", 
                      Icons.login,
                      () => {
                        Navigator.pushReplacementNamed(context, Dashboard.routeName)
                      }
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Link(
                      "Don't have an account? Sign Up",
                      () {
                        Navigator.pushReplacementNamed(context, Signup.routeName);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  toggleObsecurePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
