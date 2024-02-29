import 'package:flutter/material.dart';
import 'package:table_side/components/auth_shared.dart';

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
    return MaterialButton(
      color: AuthShared.color1,
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
