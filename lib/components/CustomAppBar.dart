import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(
            fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: const Color(0xff5603AD),
      toolbarHeight: 100,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: MaterialButton(
            onPressed: () {
              // TODO: Redirect to profile screen
            },
            child: const Row(
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,),
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

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
