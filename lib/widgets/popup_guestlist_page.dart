import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'add_guest.dart';
import 'show_guest.dart';
import '../app_style.dart';
import '../size_config.dart';

class PopupGuestlistPage extends StatefulWidget {
  final String title;

  const PopupGuestlistPage({
    super.key,
    required this.title,
  });

  @override
  State<PopupGuestlistPage> createState() => _PopupGuestlistPageState();
}

class _PopupGuestlistPageState extends State<PopupGuestlistPage> {
  Stream<List<DocumentSnapshot>> getGuestsStream(
      User? user, String familyName) {
    return FirebaseFirestore.instance
        .collection('guests')
        .doc(user!.uid)
        .collection(familyName)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  void updateGuestConfirmation(
      DocumentSnapshot guestSnapshot, bool newConfirmation) async {
    try {
      await guestSnapshot.reference.update({'guestConfirmed': newConfirmation});
    } catch (e) {
      // print('Error updating guest confirmation: $e');
    }
  }

  void deleteTask(DocumentSnapshot taskSnapshot) async {
    try {
      await taskSnapshot.reference.delete();
    } catch (e) {
      // print('Error deleting task: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: Text(widget.title),
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: kPrimaryBlue),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryBlue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddGuest(title: widget.title),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<DocumentSnapshot>>(
        stream: getGuestsStream(user, widget.title),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<DocumentSnapshot> guests = snapshot.data!;
            if (guests.isEmpty) {
              return const Center(
                child: Text('No Guests Found.'),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                left: sizeHorizontal * 5,
                right: sizeHorizontal * 5,
              ),
              child: ListView.builder(
                itemCount: guests.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> guestData =
                      guests[index].data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ShowGuest(
                      guestName: guestData['guestName'],
                      guestNote: guestData['guestNote'],
                      guestConfirmed: guestData['guestConfirmed'],
                      deleteFunction: (context) => deleteTask(guests[index]),
                      updateConfirmationFunction: (newConfirmation) =>
                          updateGuestConfirmation(
                              guests[index], newConfirmation),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
