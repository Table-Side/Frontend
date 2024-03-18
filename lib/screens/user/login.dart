import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/components/auth_shared.dart';

class LoginScreen extends StatefulWidget {
  final Function()? onTapRegister;
  const LoginScreen({super.key, required this.onTapRegister});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //Methods
  void userSignIn() async {
    //Progress indicator
    showDialog(
        context: context,
        builder: (context) {
          return const Center(child: CircularProgressIndicator());
        });

    if (emailController.text == "") //Empty field email
    {
      Navigator.pop(context);
      AuthShared.errorMessage(context, "Email field cannot be empty");
    } else if (passwordController.text == "") //Empty field password
    {
      Navigator.pop(context);
      AuthShared.errorMessage(context, "Password field cannot be empty");
    } else //Try to sign in
    {
      //TODO: Sign in function using emailController.text and passwordController.text
      // - Hide the progress indicator once logged in or when login failed - Navigator.pop(context);
      // - If wrong email     - AuthShared.errorMessage(context, "Incorrect Email");
      // - If wrong password  - AuthShared.errorMessage(context, "Sorry, that's not the right password");
    }
  }

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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50),

                    //Welcome message
                    Text(
                      'Welcome back to Table Side',
                      style: AuthShared.textTitle2,
                      textAlign: TextAlign.center,
                    ),

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

                    //Forgot Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Text(
                        'Forgot Password?',
                        style: AuthShared.textDefault,
                        textAlign: TextAlign.end,
                      ),
                    ),

                    const SizedBox(height: 25),

                    //Sign In Button
                    AuthButton(
                      text: "Login",
                      onTap: userSignIn,
                    ),

                    const SizedBox(height: 50),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          AuthShared.divider,
                          const SizedBox(width: 4),
                          Text('Don\'t have an account?',
                              style: AuthShared.textDefault),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: widget.onTapRegister,
                            child: Text('Register now',
                                style: AuthShared.textLink),
                          ),
                          const SizedBox(width: 4),
                          AuthShared.divider,
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
