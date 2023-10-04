import 'package:flutter/material.dart';
import '../app_style.dart';

class CardPlanning extends StatefulWidget {
  const CardPlanning({super.key});

  @override
  State<CardPlanning> createState() => _CardPlanningState();
}

class _CardPlanningState extends State<CardPlanning> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 10.0,
        right: 10.0,
      ),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: const BoxDecoration(
          color: kPrimaryGray,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Planning",
                    style: TextStyle(
                      color: kPrimaryBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "25%",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 150,
                height: 25,
                decoration: const BoxDecoration(
                  color: kPrimaryBlue,
                  borderRadius: BorderRadius.all(Radius.circular(12.5)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
