import 'package:flutter/material.dart';

class LoginInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const LoginInputField({
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
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff5603AD)),
            ),
            fillColor: const Color(0xff5603AD).withOpacity(0.2),
            filled: true,
            hintText: hintText,
            hintStyle:
                TextStyle(color: const Color(0xff5603AD).withOpacity(0.4))),
        style: const TextStyle(
          color: Color(0xff5603AD),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
