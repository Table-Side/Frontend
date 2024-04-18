import 'package:flutter/material.dart';
import 'package:table_side/components/auth_button.dart';
import 'package:table_side/components/auth_input_field.dart';
import 'package:table_side/const/design.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_side/provider/authentication_provider.dart';
import 'package:table_side/routes.dart';

import '../../domain/exception.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  //Controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // final baseUrl = 'https://auth.tableside.site';
  final realm = 'Tableside';
  final clientId = 'apisix';
  final grantType = 'password';
  final scope = 'openid';
  final clientSecret = '97WttOkNUXpZ9syENIBNhkXssmMKUUzd';

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
                      onTap: () async {
                        try {
                          // Trigger login action
                          await ref.read(authenticationProvider.notifier).login(
                                email: emailController.text,
                                password: passwordController.text,
                                clientId: clientId,
                                grantType: grantType,
                                scope: scope,
                                clientSecret: clientSecret,
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
