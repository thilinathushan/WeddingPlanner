import 'package:flutter/material.dart';

import '../app_style.dart';
import '../size_config.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double useableSizeVertical = SizeConfig.useableBlockSizeVertical!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: const Text("Task"),
        centerTitle: true,
        forceMaterialTransparency: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
            color: kPrimaryBlue,
          )
        ],
      ),
      body: Column(
        children: [
          //task name input field
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0,
              right: 10.0,
            ),
            child: Container(
              width: screenWidth,
              height: useableSizeVertical * 15,
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
                    const SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      "assets/task-icons/edit.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Task Title",
                      style: TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //description input feild
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0,
              right: 10.0,
            ),
            child: Container(
              width: screenWidth,
              height: useableSizeVertical * 15,
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
                    const SizedBox(
                      width: 10.0,
                    ),
                    Image.asset(
                      "assets/task-icons/edit.png",
                      height: 30,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Task Note",
                      style: TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
