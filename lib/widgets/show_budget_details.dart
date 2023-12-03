// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:planner/app_style.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class ShowBudgetDetails extends StatelessWidget {
  String budget;
  String balance;

  ShowBudgetDetails({
    super.key,
    required this.budget,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    return Container(
      padding: const EdgeInsets.all(10.0),
      width: sizeHorizontal * 90, // Set the width as needed
      height: sizeVertical * 15,
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius:
            BorderRadius.circular(25), // Adjust border radius as needed
      ),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Budget",
                      style: TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      budget,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                VerticalDivider(
                  color: Colors.grey[350],
                  thickness: 2,
                ),
                Column(
                  children: [
                    const Text(
                      "Balance",
                      style: TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      balance,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
