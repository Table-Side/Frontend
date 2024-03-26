import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/components/auth_shared.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/screens/user/login.dart';

class RegisterScreen extends StatefulWidget {
  // final Function()? onTapLogin;
  // const RegisterScreen({super.key, required this.onTapLogin});
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  //Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // TODO(A): REMOVE?
  //Methods
  // void userSignUp() async {
  //   //Progress indicator
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return const Center(child: CircularProgressIndicator());
  //       });
  //
  //   if (emailController.text == "") //Empty field email
  //   {
  //     Navigator.pop(context);
  //     AuthShared.errorMessage(context, "Email field cannot be empty");
  //   } else if (passwordController.text == "") //Empty field password
  //   {
  //     Navigator.pop(context);
  //     AuthShared.errorMessage(context, "Password field cannot be empty");
  //   } else if (passwordController.text != confirmPasswordController.text) {
  //     //Password fields not matching
  //     Navigator.pop(context);
  //     AuthShared.errorMessage(context, "Passwords must match");
  //   } else //Try to create account
  //   {
  //     //TODO: Sign up function using emailController.text and passwordController.text
  //     // - Hide the progress indicator once signed in or when sign in failed - Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  Text('Create an Account', style: AuthShared.textTitle1),

                  const SizedBox(height: 25),

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

                  //Sign In Button
                  AuthButton(
                    text: "Register",
                    // onTap: userSignUp,
                    onTap: () {
                      if (emailController.text == "") //Empty field email
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Email field cannot be empty");
                      } else if (passwordController.text ==
                          "") //Empty field password
                      {
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Password field cannot be empty");
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        //Password fields not matching
                        Navigator.pop(context);
                        AuthShared.errorMessage(
                            context, "Passwords must match");
                      } else //Try to create account
                      {
                        // TODO(A): MAKE POST REQUEST TO CREATE USER
                        //TODO: Sign up function using emailController.text and passwordController.text
                        // - Hide the progress indicator once signed in or when sign in failed - Navigator.pop(context);
                      }
                    },
                  ),

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
                        Text('Already have an account?',
                            style: AuthShared.textDefault),
                        const SizedBox(width: 4),
                        GestureDetector(
                          // onTap: widget.onTapLogin,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (final context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text('Login now', style: AuthShared.textLink),
                        ),
                        const SizedBox(width: 4),
                        Divider(
                          thickness: 0.5,
                          color: purpleColor.withOpacity(0.6),
                        ),
                      ],
                    ),
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
