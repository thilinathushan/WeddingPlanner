// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:planner/pages/onboard_details/personal_details.dart';
import '../pages/auth/social_login_second.dart';
import '../app_style.dart';
import '../size_config.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  //logout user
  void logout() async {
    await auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appDrawerSize = SizeConfig.appDrawerSize!;
    return SizedBox(
      width: appDrawerSize,
      child: Drawer(
        backgroundColor: kDarkWhiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "W E D D I N G  P L A N N E R",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text(
                      "H O M E",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(
                      "U S E R",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PersonalDetails(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                bottom: 10.0,
              ),
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text(
                  "L O G O U T",
                  style: TextStyle(fontSize: 15.0),
                ),
                onTap: () {
                  logout();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SocialLoginSecond(),
                    ),
                  );
                  // Redirect to the login page
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
