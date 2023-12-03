import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/db_user_model.dart';
import '../providers/user_details_provider.dart';
import '../size_config.dart';
import '../widgets/show_budget_details.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserDetailsProvider>(context).userData;
    SizeConfig().init(context);
    // double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;
    String? budget = userData!.budget;
    String? balance = budget;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            left: sizeHorizontal * 5,
            right: sizeHorizontal * 5,
            top: sizeHorizontal * 5),
        child: Column(
          children: [
            ShowBudgetDetails(budget: budget, balance: balance),
          ],
        ),
      ),
    );
  }
}
