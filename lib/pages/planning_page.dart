import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: carddata.checklistData.length,
              itemBuilder: (context, index) {
                return CardChecklist(
                  checkTitle: carddata.checklistData[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PopupChecklistPage(
                            title: carddata.checklistData[index]),
                      ),
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
