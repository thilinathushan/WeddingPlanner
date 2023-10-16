import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../onboard_details/personal_details.dart';
import '../../services/auth_services.dart';
import '../../components/auth/social_signin.dart';
import '../../app_style.dart';
import '../../size_config.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PersonalDetails()),
          );
        }
      },
    );

    return Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: sizeVertical * 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Social",
                  style: TextStyle(color: kPinkColor, fontSize: 40),
                ),
                SizedBox(
                  width: sizeHorizontal * 4,
                ),
                const Text(
                  "Login",
                  style: TextStyle(color: kPrimaryBlack, fontSize: 40),
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
              height: sizeVertical * 8,
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
                  onTap: () => AuthServices().signInWithGoogle(),
                ),

                SizedBox(
                  height: sizeVertical * 8,
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
                  height: sizeVertical * 8,
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
