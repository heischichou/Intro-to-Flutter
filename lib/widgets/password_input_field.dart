import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback onTap;
  
  const PasswordInputField(
    this.labelText, 
    this.hintText, 
    this.obscureText, 
    this.controller, 
    this.keyboardType, 
    this.onTap, 
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
            obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}