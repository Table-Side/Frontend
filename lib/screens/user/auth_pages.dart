// import 'package:flutter/material.dart';
// import 'package:table_side/screens/user/login.dart';
// import 'package:table_side/screens/user/register.dart';
//
// class AuthPages extends StatefulWidget {
//   const AuthPages({super.key});
//
//   @override
//   State<AuthPages> createState() => _AuthPagesState();
// }
//
// class _AuthPagesState extends State<AuthPages> {
//
//   bool showLogin = true;
//
//   void switchPages()
//   {
//     setState(() {
//       showLogin = !showLogin;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (showLogin) {
//       return LoginScreen(
//         onTapRegister: switchPages,
//       );
//     }
//     else {
//       return RegisterScreen(
//         onTapLogin: switchPages,
//       );
//     }
//   }
// }
