import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CoupleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoupleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final firstName = user?.displayName?.split(' ')[0];
    final profilePictureUrl = user?.photoURL;
    const userProfile = 'assets/icons/man.png';
    // if(firstName==null){}

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
                    child: profilePictureUrl != null
                        ? Image.network(
                            profilePictureUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
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
                const Text("Anne",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(
        double.maxFinite,
        100,
      );
}
