import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../providers/user_details_provider.dart';
import 'package:provider/provider.dart';
import '../models/db_user_model.dart';

class CoupleAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CoupleAppBar({super.key});

  @override
  State<CoupleAppBar> createState() => _CoupleAppBarState();

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        100,
      );
}

class _CoupleAppBarState extends State<CoupleAppBar> {
  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserDetailsProvider>(context).userData;
    const userProfile = 'assets/icons/man.png';

    User? auth = FirebaseAuth.instance.currentUser;

    String? firstName = userData?.yourName;
    String? partnerName = userData?.partnerName;
    String? yourprofilePictureUrl = auth?.photoURL;

    // print("PhotoURL NEW : " + yourprofilePictureUrl.toString());

    return Container(
      width: double.infinity,
      height: 100.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 1.0,
            offset: Offset(0.0, 0.75),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50, // Adjust the width as needed
                  height: 50, // Adjust the height as needed
                  child: ClipOval(
                    child: yourprofilePictureUrl != null
                        ? Image.network(
                            yourprofilePictureUrl,
                            width: 50,
                            height: 50,
                          )
                        : Image.asset(
                            userProfile,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  firstName ?? "Your Name",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            "Our Wedding",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  partnerName ?? "Partner Name",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
