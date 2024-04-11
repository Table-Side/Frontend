import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/auth_shared.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/screens/user/profile_editor.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(text: "Table Side"),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),

                  // TODO: ADD LOGO

                  // TODO(A): GET DATA FROM DB
                  //Name and email
                  Text('<Name>', style: AuthShared.textTitle0),
                  Text('<Email>', style: AuthShared.textTitle2),

                  const SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Divider(
                          thickness: 0.5,
                          color: purpleColor.withOpacity(0.6),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            // TODO(A): MAKE LOGOUT REQUEST
                          },
                          child: Text('Log out', style: AuthShared.textLinkBig),
                        ),
                        const SizedBox(width: 4),
                        Divider(
                          thickness: 0.5,
                          color: purpleColor.withOpacity(0.6),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => context.push('/profile/editProfile'),
                          child: Text('Edit details',
                              style: AuthShared.textLinkBig),
                        ),
                        const SizedBox(width: 4),
                        Divider(
                          thickness: 0.5,
                          color: purpleColor.withOpacity(0.6),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            // TODO(A): MAKE DELETE REQUEST
                          },
                          child: Text('Delete account',
                              style: AuthShared.textLinkBig),
                        ),
                        const SizedBox(width: 4),
                        Divider(
                          thickness: 0.5,
                          color: purpleColor.withOpacity(0.6),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // TODO(A): NEED TO CHECK IF THIS CAN BE DONE
                  // TODO(A): GET DATA FROM DB
                  Text('<restaurants and orders go here>',
                      style: AuthShared.textDefault),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
