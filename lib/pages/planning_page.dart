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

  Stream<int> getTaskCountStream(String category) {
    return FirebaseFirestore.instance
        .collection('planning')
        .doc(category)
        .collection('tasks')
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: 15.0,
                bottom: 15.0,
              ),
              itemCount: carddata.checklistData.length,
              itemBuilder: (context, index) {
                String category = carddata.checklistData[index];
                String cardCheckListImage =
                    carddata.checkListDataImgLink[index];

                return StreamBuilder<int>(
                  stream: getTaskCountStream(category),
                  builder: (context, snapshot) {
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
