import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/components/auth_shared.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/screens/user/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

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

                    // TODO: ADD LOGO

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

                    // TODO(A): THIS ISN'T BEING USED REMOVE IT?
                    //Forgot Password
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    //   child: Text(
                    //     'Forgot Password?',
                    //     style: AuthShared.textDefault,
                    //     textAlign: TextAlign.end,
                    //   ),
                    // ),

                    const SizedBox(height: 25),

                    //Sign In Button
                    AuthButton(
                        text: "Login",
                        // onTap: userSignIn,
                        onTap: () {
                          // TODO(A): AUTHENTICATE AND LOG USER IN
                        }),

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
                          Text('Don\'t have an account?',
                              style: AuthShared.textDefault),
                          const SizedBox(width: 4),
                          GestureDetector(
                            // onTap: widget.onTapRegister,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (final context) =>
                                      const RegisterScreen(),
                                ),
                              );
                            },
                            child: Text('Register now',
                                style: AuthShared.textLink),
                          ),
                          const SizedBox(width: 4),
                          Divider(
                            thickness: 0.5,
                            color: purpleColor.withOpacity(0.6),
                          ),
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
