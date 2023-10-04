import 'package:flutter/material.dart';
import '../app_style.dart';

class CardTimeLine extends StatefulWidget {
  const CardTimeLine({super.key});

  @override
  State<CardTimeLine> createState() => _CardTimeLineState();
}

class _CardTimeLineState extends State<CardTimeLine> {
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thilina & Anne",
                    style: TextStyle(
                      color: kPrimaryBlue,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Days
                        Column(
                          children: [
                            Text(
                              "1095",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Days",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),

                        VerticalDivider(
                          color: kPrimaryBlack,
                          thickness: 1.0,
                        ),

                        //Hours
                        Column(
                          children: [
                            Text(
                              "09",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Hours",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),

                        VerticalDivider(
                          color: kPrimaryBlack,
                          thickness: 1.0,
                        ),

                        //Minutes
                        Column(
                          children: [
                            Text(
                              "50",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Minutes",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: kPrimaryBlack,
                          thickness: 1.0,
                        ),

                        //seconds
                        Column(
                          children: [
                            Text(
                              "30",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Seconds",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
