import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:table_side/components/custom_app_bar.dart';
import 'package:table_side/const/design.dart';
import 'package:table_side/provider/authentication_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final account = ref.watch(authenticationProvider).valueOrNull;

    if (account == null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(text: "Table Side"),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

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
                  //Logo
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      height: 200,
                    ),
                  ),

                  //Name and email
                  Text(
                    account.name,
                    style: AuthShared.textTitle0.copyWith(fontSize: 40),
                  ),
                  Text(
                    account.email,
                    style: AuthShared.textTitle2.copyWith(fontSize: 30),
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
                        GestureDetector(
                          onTap: () {
                            ref.read(authenticationProvider.notifier).logout();
                            context.push('/login');
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
                            // TODO: Make delete request - might not be able to do
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
