import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback onTap;
  final String? repeatPassword;
  
  const PasswordInputField(
    this.labelText, 
    this.hintText, 
    this.obscureText, 
    this.controller, 
    this.keyboardType, 
    this.onTap, 
    this.repeatPassword,
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$labelText is required.';
        } else if(repeatPassword != null && value != repeatPassword) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}