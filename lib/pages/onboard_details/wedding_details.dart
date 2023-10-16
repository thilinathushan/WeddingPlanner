import 'package:flutter/material.dart';
import 'package:planner/pages/dashboard_page.dart';
import '../../size_config.dart';
import '../../app_style.dart';

class WeddingDetails extends StatelessWidget {
  const WeddingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    return Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: sizeHorizontal * 10, right: sizeHorizontal * 10),
          child: Column(
            children: [
              SizedBox(
                height: sizeVertical * 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Wedding",
                    style: TextStyle(color: kPinkColor, fontSize: 35),
                  ),
                  SizedBox(
                    width: sizeHorizontal * 4,
                  ),
                  const Text(
                    "Details",
                    style: TextStyle(color: kPrimaryBlack, fontSize: 35),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: sizeVertical * 10,
                  ),
                  Container(
                    height: sizeVertical * 0.5,
                    width: 90,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(10), // Adjust the top-left corner
                        bottomLeft: Radius.circular(
                            10), // Adjust the bottom-left corner
                      ),
                    ),
                  ),
                  Container(
                    height: sizeVertical * 0.5,
                    width: 150,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight:
                            Radius.circular(10), // Adjust the top-left corner
                        bottomRight: Radius.circular(
                            10), // Adjust the bottom-left corner
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: sizeVertical * 2,
              ),

              // Your Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter Date",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: sizeVertical * 2,
                  ),
                  Container(
                    height: sizeVertical * 9, // Set the height as needed
                    width: sizeHorizontal * 80, // Set the width as needed
                    padding:
                        const EdgeInsets.all(10), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(
                          50), // Adjust border radius as needed
                    ),
                  ),

                  SizedBox(
                    height: sizeVertical * 3,
                  ),

                  const Text(
                    "Location",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: sizeVertical * 2,
                  ),
                  // facebook
                  Container(
                    height: sizeVertical * 9, // Set the height as needed
                    width: sizeHorizontal * 80, // Set the width as needed
                    padding:
                        const EdgeInsets.all(10), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(
                          50), // Adjust border radius as needed
                    ),
                  ),
                  SizedBox(
                    height: sizeVertical * 3,
                  ),

                  const Text(
                    "Budget",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  SizedBox(
                    height: sizeVertical * 2,
                  ),

                  Container(
                    height: sizeVertical * 9, // Set the height as needed
                    width: sizeHorizontal * 80, // Set the width as needed
                    padding:
                        const EdgeInsets.all(10), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius: BorderRadius.circular(
                          50), // Adjust border radius as needed
                    ),
                  ),

                  SizedBox(
                    height: sizeVertical * 7,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: sizeVertical * 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: sizeHorizontal * 35,
                              height: sizeVertical * 7,
                              decoration: BoxDecoration(
                                color: kYellowColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
