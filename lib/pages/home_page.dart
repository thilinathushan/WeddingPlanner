import 'package:flutter/material.dart';
import 'package:planner/widgets/card_budget.dart';
import 'package:planner/widgets/card_guest.dart';
import 'package:planner/widgets/card_planning.dart';
import 'package:planner/widgets/card_timeline.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 5.0,
        ),
        CardTimeLine(),
        CardPlanning(),
        CardBudget(),
        CardGuest(),
      ],
    );
  }
}
