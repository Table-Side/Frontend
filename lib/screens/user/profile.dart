import 'package:flutter/material.dart';
import 'package:table_side/components/auth_shared.dart';
import 'package:table_side/components/CustomAppBar.dart';

class ProfileScreen extends StatefulWidget {
  final Function()? onTapEditProfile; 
  const ProfileScreen({super.key, required this.onTapEditProfile});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Methods
  void userSignOut() async {
    //Progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      }
    );

    //TODO: Sign out function
  }

  void userDeleteAccount() async {
    //Progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      }
    );

    //TODO: Delete account function
  }
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
              
                      //Name and email
                      Text('<Name>', style: AuthShared.textTitle0),
                      Text('<Email>', style: AuthShared.textTitle2),
              
                      const SizedBox(height: 50),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            AuthShared.divider,
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: userSignOut,
                              child: Text('Log out', style: AuthShared.textLinkBig)
                            ),
                            const SizedBox(width: 4),
                            AuthShared.divider,
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: widget.onTapEditProfile,
                              child: Text('Edit details', style: AuthShared.textLinkBig)
                            ),
                            const SizedBox(width: 4),
                            AuthShared.divider,
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: userDeleteAccount,
                              child: Text('Delete account', style: AuthShared.textLinkBig)
                            ),
                            const SizedBox(width: 4),
                            AuthShared.divider,
                          ],
                        ),
                      ),
              
                      const SizedBox(height: 50),
                      
                      Text('<restaurants and orders go here>', style: AuthShared.textDefault),
                    ]),
              ),
            ),
          ),
        ));
  }
}
