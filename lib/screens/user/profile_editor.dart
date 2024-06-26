import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/const/design.dart';

class ProfileEditorScreen extends StatefulWidget {
  const ProfileEditorScreen({super.key});

  @override
  State<ProfileEditorScreen> createState() => _ProfileEditorScreenState();
}

class _ProfileEditorScreenState extends State<ProfileEditorScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(text: "Tableside"),
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

                  //Title
                  Text('Edit Profile', style: AuthShared.textTitle1),

                  const SizedBox(height: 25),

                  //Name input
                  AuthInputField(
                    controller: _nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  //Email input
                  AuthInputField(
                    controller: _emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  //Password input
                  AuthInputField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  //Conform password input
                  AuthInputField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //Save changes button
                  AuthButton(
                    text: "Save Changes",
                    onTap: () {
                      if (_nameController.text == "") //Empty field name
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Name field cannot be empty");
                      } else if (_emailController.text ==
                          "") //Empty field email
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Email field cannot be empty");
                      } else if (_passwordController.text !=
                          _confirmPasswordController.text) {
                        //Password fields not matching
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Passwords must match");
                      } else //Try to save changes
                      {
                        // Update user profile details
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
