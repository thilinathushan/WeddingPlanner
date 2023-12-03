import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planner/widgets/add_family.dart';
import '../size_config.dart';
import '../widgets/card_guestlist.dart';
import 'package:provider/provider.dart';
import '../app_style.dart';
import '../models/db_user_model.dart';
import '../providers/user_details_provider.dart';
import '../widgets/popup_guestlist_page.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  final String familyName = "Family Name";

  Stream<int> getGuestCountStream(User? user, String familyName) {
    return FirebaseFirestore.instance
        .collection('guests')
        .doc(user!.uid)
        .collection(familyName)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    // double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    UserData? userData = Provider.of<UserDetailsProvider>(context).userData;
    String? firstName = userData?.yourName;
    String? partnerName = userData?.partnerName;

    String yourFamilyName = "$firstName's Family";
    String partnerFamilyName = "$partnerName's Family";

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddFamily(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: sizeVertical * 1,
          ),
          CardGuestlist(
            guestTitle: yourFamilyName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PopupGuestlistPage(title: yourFamilyName),
                ),
              );
            },
          ),
          SizedBox(
            height: sizeVertical * 1,
          ),
          CardGuestlist(
            guestTitle: partnerFamilyName,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PopupGuestlistPage(title: partnerFamilyName),
                ),
              );
            },
          ),
          // Expanded(
          //   child: ListView.builder(
          //       padding: const EdgeInsets.only(
          //         bottom: 15.0,
          //       ),
          //       itemCount: 2,
          //       itemBuilder: (context, index) {
          //         return CardGuestlist(
          //           guestTitle: familyName,
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) =>
          //                     PopupGuestlistPage(title: familyName),
          //               ),
          //             );
          //           },
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}
