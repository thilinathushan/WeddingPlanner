import 'package:flutter/material.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Text(
          "Budget Page",
          style: TextStyle(fontSize: 30),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 10.0,
            right: 10.0,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
