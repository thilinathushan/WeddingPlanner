import 'package:flutter/material.dart';
import '../widgets/card_budget.dart';
import '../widgets/card_guest.dart';
import '../widgets/card_planning.dart';
import '../widgets/card_timeline.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: const [
              CardTimeLine(),
              CardPlanning(),
              CardBudget(),
              CardGuest(),
            ],
          ),
        ),
      ],
    );
  }
}
