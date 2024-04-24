import 'package:flutter/material.dart';
import 'package:table_side/const/design.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function()? onTap;

  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap!();
      },
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        backgroundColor: purpleColor,
      ),
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
