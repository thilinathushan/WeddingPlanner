import 'package:flutter/material.dart';
import '../dashboard_page.dart';
import '../../app_style.dart';
import '../../components/auth/social_signin.dart';
import '../../services/auth_services.dart';
import '../../size_config.dart';

class SocialLoginSecond extends StatefulWidget {
  const SocialLoginSecond({super.key});

  @override
  State<SocialLoginSecond> createState() => _SocialLoginSecondState();
}

class _SocialLoginSecondState extends State<SocialLoginSecond> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    final AuthServices auth = AuthServices();

    void pageRoute() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const DashboardPage(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: sizeVertical * 5,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Wedding Planner",
                  style: TextStyle(color: kPinkColor, fontSize: 40),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: sizeVertical * 10,
                ),
                Container(
                  height: sizeVertical * 0.5,
                  width: 90,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft:
                          Radius.circular(10), // Adjust the top-left corner
                      bottomLeft:
                          Radius.circular(10), // Adjust the bottom-left corner
                    ),
                  ),
                ),
                Container(
                  height: sizeVertical * 0.5,
                  width: 150,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(10), // Adjust the top-left corner
                      bottomRight:
                          Radius.circular(10), // Adjust the bottom-left corner
                    ),
                  ),
                ),
              ],
            ),

            // scocisl  log in

            SizedBox(
              height: sizeVertical * 2,
            ),
            Image(
              image: const AssetImage('assets/Kissing.gif'),
              height:
                  sizeVertical * 35, // Replace with the actual path to your GIF
            ),
            SizedBox(
              height: sizeVertical * 2,
            ),
            // google

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SocialSignIn(
                  imagePath: const AssetImage('assets/auth/google.png'),
                  socialLoginText: "Continue with Google",
                  socialLoginTextColor: kPrimaryBlack,
                  btnColor: Colors.white,
                  onTap: () async {
                    dynamic result = await auth.signInWithGoogle();
                    if (result != Null) {
                      // print("Logged In: " + result.uid);
                      pageRoute();
                    }
                    // else {
                    //   print("Error in sign in");
                    // }
                  },
                ),

                SizedBox(
                  height: sizeVertical * 3,
                ),

                // facebook
                SocialSignIn(
                  imagePath: const AssetImage('assets/auth/facebook.png'),
                  socialLoginText: "Continue with Facebook",
                  socialLoginTextColor: Colors.white,
                  btnColor: kPrimaryBlue,
                  onTap: () {},
                ),

                SizedBox(
                  height: sizeVertical * 3,
                ),

                // Apple
                SocialSignIn(
                  imagePath: const AssetImage('assets/auth/apple.png'),
                  socialLoginText: "Continue with Apple",
                  socialLoginTextColor: Colors.white,
                  btnColor: kPrimaryBlack,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
