// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../pages/dashboard_page.dart';
import '../pages/edit_personal_details.dart';
import '../pages/edit_wedding_details.dart';
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
        backgroundColor: appDrawerColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Image.asset("assets/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text(
                      "Home",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text(
                      "Personal Details",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditPersonalDetails(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: const Icon(Icons.wc),
                    title: const Text(
                      "Wedding Details",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditWeddingDetails(),
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
                leading: const Icon(Icons.logout_rounded),
                title: const Text(
                  "SignOut",
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
