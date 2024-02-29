import 'package:flutter/material.dart';

class AuthShared {

  static Color color1 = const Color(0xff5603AD);
  static double fontSize1 = 16;
  static TextStyle textTitle1    = TextStyle(fontSize: fontSize1 * 3, color: color1.withOpacity(0.6));
  static TextStyle textTitle2    = TextStyle(fontSize: fontSize1 * 2, color: color1.withOpacity(0.6));
  static TextStyle textDefault    = TextStyle(fontSize: fontSize1, color: color1.withOpacity(0.6));
  static TextStyle textLink       = TextStyle(fontSize: fontSize1, color: color1, fontWeight: FontWeight.bold);
  
  static Expanded divider = Expanded(
    child: Divider(
      thickness: 0.5,
      color: color1.withOpacity(0.6),
    ),
  );
  
  static void errorMessage(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(child: Text(message, style: textDefault)),
          );
        });
  }
}