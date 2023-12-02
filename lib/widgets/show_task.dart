import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class ShowTask extends StatelessWidget {
  String taskName;
  String taskDescripion;
  bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

  ShowTask({
    super.key,
    required this.taskName,
    required this.taskDescripion,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
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
              children: [
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: (value) => onChanged!(value), // Fix here
                  activeColor: Colors.black,
                ),
                SizedBox(
                  height: sizeHorizontal * 5,
                ),
                //column for name and description
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskName,
                      style: TextStyle(
                          fontSize: 18,
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
                    ),
                    Text(
                      taskDescripion,
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                          decoration: taskCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
