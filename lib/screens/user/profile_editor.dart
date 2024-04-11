import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/components/CustomAppBar.dart';
import 'package:table_side/const/design.dart';

class ProfileEditorScreen extends StatefulWidget {
  const ProfileEditorScreen({super.key});

  @override
  State<ProfileEditorScreen> createState() => _ProfileEditorScreenState();
}

class _ProfileEditorScreenState extends State<ProfileEditorScreen> {
  //Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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

                  //Title
                  Text('Edit Profile', style: AuthShared.textTitle1),

                  const SizedBox(height: 25),

                  //Name input
                  AuthInputField(
                    controller: nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  //Email input
                  AuthInputField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false,
                  ),

                  const SizedBox(height: 10),

                  //Password input
                  AuthInputField(
                    controller: passwordController,
                    hintText: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 10),

                  //Conform password input
                  AuthInputField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    obscureText: true,
                  ),

                  const SizedBox(height: 25),

                  //Save changes button
                  AuthButton(
                    text: "Save Changes",
                    // onTap: userProfileSaveChanges,
                    onTap: () {
                      if (nameController.text == "") //Empty field name
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Name field cannot be empty");
                      } else if (emailController.text == "") //Empty field email
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Email field cannot be empty");
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        //Password fields not matching
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Passwords must match");
                      } else //Try to save changes
                      {
                        // TODO(A): MAKE PUT/PATCH REQUEST
                        // TODO(A): MAKE INTO A FORM TO MAKE VALIDATION WORK BETTER?
                        // - Also currently it doesn't check for empty passwords as the user might not want to change it
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
