import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/const/design.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});
  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: purpleColor,
      toolbarHeight: 100,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: MaterialButton(
            onPressed: () => context.go('/profile'),
            child: const Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
