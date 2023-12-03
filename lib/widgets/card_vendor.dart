// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:planner/app_style.dart';

import '../size_config.dart';

// ignore: must_be_immutable
class CardVendor extends StatelessWidget {
  String vendorName;
  String jobName;
  String price;
  String vendorCategory;

  CardVendor({
    super.key,
    required this.vendorName,
    required this.jobName,
    required this.price,
    required this.vendorCategory,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    const userProfile = 'assets/icons/man.png';

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: sizeHorizontal * 90, // Set the width as needed
        decoration: BoxDecoration(
          color: kPrimaryGray, // Background color
          borderRadius:
              BorderRadius.circular(25), // Adjust border radius as needed
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Image.asset(
                      userProfile,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      vendorName,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Text(
                      jobName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    vendorCategory,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(children: [
                    // const Icon(Icons.money, color: Colors.grey, size: 35),
                    const Text(
                      "Rs: ",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: sizeHorizontal * 35,
                            height: sizeVertical * 5,
                            decoration: BoxDecoration(
                              color: kYellowColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.message_outlined,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Center(
                                  child: Text(
                                    "Contact",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            width: sizeHorizontal * 35,
                            height: sizeVertical * 5,
                            decoration: BoxDecoration(
                              color: kYellowColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Center(
                                  child: Text(
                                    "WishList",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            )),
      ),
    );
  }
}
