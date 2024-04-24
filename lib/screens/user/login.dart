import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/const/design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/domain/exception.dart';
import 'package:table_side/provider/authentication_provider.dart';
import 'package:table_side/routes.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                    //Logo
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        height: 200,
                      ),
                    ),

                    //Welcome message
                    Text(
                      'Welcome to Table Side',
                      style: AuthShared.textTitle2,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 25),

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

                    const SizedBox(height: 25),

                    //Sign In Button
                    AuthButton(
                      text: "Login",
                      onTap: () async {
                        try {
                          // Trigger login action
                          await ref.read(authenticationProvider.notifier).login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        } on TableSideException catch (ex) {
                          if (routerKey.currentContext?.mounted ?? false) {
                            await showDialog<String>(
                              context: routerKey.currentContext!,
                              builder: (final context) => AlertDialog(
                                title: const Text("An error has occurred"),
                                content: Text(ex.message),
                                actions: [
                                  OutlinedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("Try Again"),
                                  ),
                                ],
                              ),
                            );
                          }
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
                          Text('Don\'t have an account?',
                              style: AuthShared.textDefault),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {},
                            // onTap: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (final context) =>
                            //           const RegisterScreen(),
                            //     ),
                            //   );
                            // },
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
