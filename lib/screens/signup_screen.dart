import 'package:flutter/material.dart';
import 'package:flutter_intro/widgets/input_field.dart';
import 'package:flutter_intro/widgets/password_input_field.dart';
import 'package:flutter_intro/widgets/primary_button.dart';
import 'package:flutter_intro/widgets/link.dart';
import 'package:flutter_intro/screens/login_screen.dart';
import 'package:flutter_intro/screens/dashboard_screen.dart';
import 'package:flutter_intro/services/auth_service.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  static const String routeName = '/signup';
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  AuthService authService = AuthService();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool obscureText = true, showSpinner = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                        "First Name", 
                        "Enter your first name", 
                        _firstNameController, 
                        TextInputType.text
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      InputField(
                        "Last Name", 
                        "Enter your last name", 
                        _lastNameController, 
                        TextInputType.text
                      ),
                      const SizedBox(
                        height: 25,
                      ),
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
                      PasswordInputField(
                        "Confirm Password", 
                        "Confirm your new password", 
                        obscureText, 
                        _confirmPasswordController, 
                        TextInputType.visiblePassword,
                        toggleObsecurePassword,
                        _confirmPasswordController.text
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      PrimaryButton(
                        "Sign Up", 
                        Icons.email_outlined,
                        () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              showSpinner = false;
                            });
                            
                            authService.signUp(
                              _emailController.text, 
                              _passwordController.text
                            ).then((res) {
                              if (res != null) {
                                Navigator.pushNamed(
                                  context, 
                                  Dashboard.routeName, 
                                  arguments: _emailController.text
                                );
                              }

                              setState(() {
                                showSpinner = false;
                              });
                            });
                          }
                        }
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Link(
                        "Already have an account? Login",
                        () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, Login.routeName);
                          }
                        }
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
}
