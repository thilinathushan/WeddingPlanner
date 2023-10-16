import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_style.dart';
import '../size_config.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  //logout user
  void logout() {
    FirebaseAuth.instance.signOut();
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
                    onTap: () {},
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
                  Navigator.pop(context);
                  logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
