import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const LoginButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: const Color(0xff5603AD),
      onPressed: () {
        onTap!();
      },
      minWidth: MediaQuery.of(context).size.width * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          text,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
      ),
    );
  }
}
