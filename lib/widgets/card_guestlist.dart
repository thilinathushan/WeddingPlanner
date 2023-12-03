import 'package:flutter/material.dart';
import '../size_config.dart';
import '/app_style.dart';

class CardGuestlist extends StatelessWidget {
  final String guestTitle;
  // final String taskCount; // this can be used to pass the guest count from the guest
  final Function()? onTap;

  const CardGuestlist({
    super.key,
    required this.guestTitle,
    // required this.taskCount,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guestTitle,
                      style: const TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     const Text(
                    //       "Guest Count",
                    //       style: TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 10.0,
                    //     ),
                    //     Text(
                    //       taskCount,
                    //       style: const TextStyle(
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //   ],
                    // ),
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
