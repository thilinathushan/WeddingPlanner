import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_style.dart';
import '../models/db_user_model.dart';
import '../providers/user_details_provider.dart';
import '../size_config.dart';

class CardBudget extends StatefulWidget {
  const CardBudget({super.key});

  @override
  State<CardBudget> createState() => _CardBudgetState();
}

class _CardBudgetState extends State<CardBudget> {
  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserDetailsProvider>(context).userData;

    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double useableSizeVertical = SizeConfig.useableBlockSizeVertical!;

    String? budget = userData!.budget;
    String? balance = budget;

    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 10.0,
        right: 10.0,
      ),
      child: Container(
        width: screenWidth,
        height: useableSizeVertical * 23,
        decoration: const BoxDecoration(
          color: kPrimaryGray,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Budget",
                    style: TextStyle(
                      color: kPrimaryBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Spent:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        balance,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Remaining:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        budget,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.blue,
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "0%",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Spent",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
