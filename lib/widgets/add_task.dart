import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_style.dart';
import '../services/user_save.dart';
import '../size_config.dart';
import 'input_task.dart';

class AddTask extends StatefulWidget {
  final String title;
  const AddTask({super.key, required this.title});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController taskNameController = TextEditingController();
  final TextEditingController taskDescriptionController =
      TextEditingController();

  @override
  void dispose() {
    taskNameController.dispose();
    taskDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    String categoryName = widget.title;
    print(categoryName);

    void saveTasks() {
      final UserSave userSave = UserSave();
      final User? user = FirebaseAuth.instance.currentUser;
      const bool taskCompleted = false;

      userSave.addTask(user, categoryName, taskNameController.text,
          taskDescriptionController.text, taskCompleted);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: const Text("Task"),
        centerTitle: true,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: kPrimaryBlue),
        actions: [
          IconButton(
            onPressed: () async {
              saveTasks();
              taskNameController.clear();
              taskDescriptionController.clear();
              Navigator.pop(
                  context); // Use Navigator.pop to go back to the previous page
            },
            icon: const Icon(Icons.check),
            color: kPrimaryBlue,
          ),
        ],
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.only(
              left: sizeHorizontal * 5, right: sizeHorizontal * 5),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: sizeVertical * 3,
              ),
              //task name input field
              Container(
                padding: const EdgeInsets.all(10.0),
                height: sizeVertical * 9, // Set the height as needed
                width: sizeHorizontal * 90, // Set the width as needed
                // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(
                      50), // Adjust border radius as needed
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InputTask(
                    controller: taskNameController,
                    hintText: "Task Name",
                    inputKeyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    hintIcon: const Icon(
                      Icons.assignment_outlined,
                      size: 35.0,
                      color: kDarkGray,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: sizeVertical * 3,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                // height: sizeVertical * 9, // Set the height as needed
                width: sizeHorizontal * 90, // Set the width as needed
                // Adjust padding as needed
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(
                      50), // Adjust border radius as needed
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InputTask(
                    controller: taskDescriptionController,
                    hintText: "Task Description",
                    inputKeyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    hintIcon: const Icon(
                      Icons.description_outlined,
                      size: 35.0,
                      color: kDarkGray,
                    ),
                    maxLines: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
