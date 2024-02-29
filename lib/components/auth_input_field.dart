import 'package:flutter/material.dart';
import 'package:table_side/components/auth_shared.dart';

class AuthInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const AuthInputField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AuthShared.color1),
            ),
            fillColor: AuthShared.color1.withOpacity(0.2),
            filled: true,
            hintText: hintText,
            hintStyle:
                TextStyle(color: AuthShared.color1.withOpacity(0.4))),
        style: TextStyle(
          color: AuthShared.color1,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
