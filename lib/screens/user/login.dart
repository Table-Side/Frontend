import 'package:flutter/material.dart';
import 'package:table_side/components/login_button.dart';
import 'package:table_side/components/login_input_field.dart';

class LoginScreen extends StatefulWidget {
  //TODO: function for linking to register screen
  // - final Function()? onTapRegister; 
  // - LoginScreen(Null Function() param0, {super.key, required this.onTapRegister});

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Styles
  final textDefault       =       TextStyle(fontSize: 16, color: const  Color(0xff5603AD).withOpacity(0.6));

  final textRegisterLink  = const TextStyle(fontSize: 16, color:        Color(0xff5603AD), fontWeight: FontWeight.bold);

  final divider = Expanded(
    child: Divider(
      thickness: 0.5,
      color: const Color(0xff5603AD).withOpacity(0.6),
    ),
  );

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
      }
    );

    //TODO: Sign in function using emailController.text and passwordController.text
      // - Hide the progress indicator once logged in or when login failed - Navigator.pop(context);
      // - If wrong email     - errorMessage("Incorrect Email");
      // - If wrong password  - errorMessage("Sorry, that's not the right password");
  }

  void errorMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Center(child: Text(message, style: textDefault)),
          );
        });
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
                    children: [
                      const SizedBox(height: 50),
              
                      //Welcome message
                      Text('Welcome back to Table Side', style: textDefault),
              
                      const SizedBox(height: 25),
              
                      //Email input
                      LoginInputField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
              
                      const SizedBox(height: 10),
              
                      //Password input
                      LoginInputField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
              
                      const SizedBox(height: 10),
              
                      //Forgot Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: textDefault,
                            ),
                          ],
                        ),
                      ),
              
                      const SizedBox(height: 25),
              
                      //Sign In Button
                      LoginButton(
                        text: "Login",
                        onTap: userSignIn,
                      ),
              
                      const SizedBox(height: 50),
              
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Row(
                          children: [
                            divider,
                            const SizedBox(width: 4),
                            Text('Don\'t have an account?', style: textDefault),
                            const SizedBox(width: 4),
                            GestureDetector(
                              //onTap: widget.onTapRegister, //TODO: function for linking to register screen
                              child: Text('Register now', style: textRegisterLink)
                              ),
                            const SizedBox(width: 4),
                            divider,
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
