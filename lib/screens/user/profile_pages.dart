import 'package:flutter/material.dart';
import 'package:table_side/screens/user/profile.dart';
import 'package:table_side/screens/user/profile_editor.dart';

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {

  bool showEditor = false;

  void switchPages() 
  {
    setState(() {
      showEditor = !showEditor;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showEditor) {
      return const ProfileEditorScreen();
    }
    else {
      return ProfileScreen(
        onTapEditProfile: switchPages,
      );
    }
  }
}