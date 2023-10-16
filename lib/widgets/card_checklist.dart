import 'package:flutter/material.dart';
import '../size_config.dart';
import '/app_style.dart';

class CardChecklist extends StatelessWidget {
  final String checkTitle;
  final Function()? onTap; // Function to handle the click event

  const CardChecklist({
    super.key,
    required this.checkTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double useableSizeVertical = SizeConfig.useableBlockSizeVertical!;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10.0,
          top: 10.0,
          right: 10.0,
        ),
        child: Container(
          width: screenWidth,
          height: useableSizeVertical * 20,
          decoration: const BoxDecoration(
            color: kPrimaryGray,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/card-images/guests-card.png",
                  width: 120.0,
                  height: 120.0,
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      checkTitle,
                      style: const TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Guest:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "150",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
