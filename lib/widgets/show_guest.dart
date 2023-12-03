// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../app_style.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class ShowGuest extends StatelessWidget {
  String guestName;
  String guestNote;
  bool guestConfirmed;
  Function(BuildContext) deleteFunction;
  Function(bool) updateConfirmationFunction;

  ShowGuest({
    super.key,
    required this.guestName,
    required this.guestNote,
    required this.guestConfirmed,
    required this.deleteFunction,
    required this.updateConfirmationFunction,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
          )
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: sizeHorizontal * 90, // Set the width as needed
        // Adjust padding as needed
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius:
              BorderRadius.circular(25), // Adjust border radius as needed
        ),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Icon
                    Icon(Icons.person_pin_outlined, size: sizeHorizontal * 8),
                    SizedBox(
                      width: sizeHorizontal * 5,
                    ),
                    // column for name and description
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          guestName,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: guestConfirmed
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          height: sizeVertical * 2,
                        ),
                        Text(
                          guestNote,
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[700],
                              decoration: guestConfirmed
                                  ? TextDecoration.none
                                  : TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => updateConfirmationFunction(!guestConfirmed),
                  child: Container(
                    width: sizeHorizontal * 12,
                    height: sizeHorizontal * 12,
                    decoration: BoxDecoration(
                        color: guestConfirmed ? kPrimaryBlue : highlightText,
                        borderRadius: BorderRadius.circular(50)),
                    child: guestConfirmed
                        ? const Icon(Icons.check, color: Colors.white)
                        : const Icon(Icons.clear, color: Colors.white),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
