import 'package:flutter/material.dart';
import 'package:flutter_intro/widgets/input_field.dart';
import 'package:flutter_intro/widgets/password_input_field.dart';
import 'package:flutter_intro/widgets/primary_button.dart';
import 'package:flutter_intro/widgets/link.dart';
import 'package:flutter_intro/screens/signup_screen.dart';
import 'package:flutter_intro/screens/dashboard_screen.dart';
import 'package:flutter_intro/services/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  static const String routeName = '/login';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool obscureText = true, showSpinner = false;
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
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
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
                        "Sign In", 
                        Icons.login,
                        () {
                          if (_formKey.currentState!.validate()) {
                            login(
                              _emailController.text, 
                              _passwordController.text
                            );
                          }
                        }
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      PrimaryButton(
                        "Sign In with Google", 
                        Icons.alternate_email,
                        () {
                          loginWithProvider();
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
      ),
    );
  }

  toggleObsecurePassword() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  login(String email, String password) async {
    try {
      setState(() {
        showSpinner = true;
      });

      var user = await authService.signInWithCredential(email, password);
      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(
          context, 
          Dashboard.routeName,
          arguments: email
        );
      }

      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  loginWithProvider() async {
    try {
      setState(() {
        showSpinner = true;
      });

      // ignore: unused_local_variable
      var user = await authService.signInWithGoogle();
      
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Dashboard.routeName);

      setState(() {
        showSpinner = false;
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
