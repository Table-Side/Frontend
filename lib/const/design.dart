import 'package:flutter/material.dart';

const purpleColor = Color(0xff5603AD);

class AuthShared {
  // static Color color1 = const Color(0xff5603AD);
  // static double fontSize1 = 16;
  static TextStyle textTitle0 =
      TextStyle(fontSize: 16 * 6, color: purpleColor.withOpacity(0.6));
  static TextStyle textTitle1 =
      TextStyle(fontSize: 16 * 3, color: purpleColor.withOpacity(0.6));
  static TextStyle textTitle2 =
      TextStyle(fontSize: 16 * 2, color: purpleColor.withOpacity(0.6));
  static TextStyle textDefault =
      TextStyle(fontSize: 16, color: purpleColor.withOpacity(0.6));
  static TextStyle textLink = const TextStyle(
      fontSize: 16, color: purpleColor, fontWeight: FontWeight.bold);
  static TextStyle textLinkBig = const TextStyle(
      fontSize: 16 * 1.5, color: purpleColor, fontWeight: FontWeight.bold);

  // static var divider = Divider(
  //   thickness: 0.5,
  //   color: purpleColor.withOpacity(0.6),
  // );

  static void errorMessage(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(message, style: textDefault),
          ),
        );
      },
    );
  }
}
