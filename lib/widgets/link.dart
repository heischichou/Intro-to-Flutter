import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Link(this.text, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}