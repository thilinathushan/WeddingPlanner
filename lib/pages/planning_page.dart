import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/popup_checklist_page.dart';
import '../widgets/card_checklist.dart';
import '../models/checklist_card_data.dart';

class PlanningPage extends StatefulWidget {
  const PlanningPage({super.key});

  @override
  State<PlanningPage> createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  CheckListCard carddata = CheckListCard();

  Stream<int> getTaskCountStream(User user, String category) {
    return FirebaseFirestore.instance
        .collection('planning')
        .doc(user.uid) // Use the user's UID here
        .collection(category) // Use the category here
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                bottom: 15.0,
              ),
              itemCount: carddata.checklistData.length,
              itemBuilder: (context, index) {
                String category = carddata.checklistData[index];
                String cardCheckListImage =
                    carddata.checkListDataImgLink[index];

                return StreamBuilder<int>(
                  key: UniqueKey(), // Add this line
                  stream: getTaskCountStream(user!, category),
                  builder: (context, snapshot) {
                    // if (snapshot.connectionState == ConnectionState.waiting &&
                    ///     /!snapshot.hasData) {
                    //   return const Center(child: CircularProgressIndicator());
                    // } else
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      int taskCount = snapshot.data ?? 0;

                      return CardChecklist(
                        checkTitle: category,
                        cardCheckListImage: cardCheckListImage,
                        taskCount: taskCount.toString(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PopupChecklistPage(title: category),
                            ),
                          );
                        },
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
