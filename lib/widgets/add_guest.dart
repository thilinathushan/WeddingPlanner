import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_style.dart';
import '../services/user_save.dart';
import '../size_config.dart';
import 'input_task.dart';

class AddGuest extends StatefulWidget {
  final String title;
  const AddGuest({super.key, required this.title});

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  final TextEditingController guestNameController = TextEditingController();
  final TextEditingController guestNoteController = TextEditingController();

  @override
  void dispose() {
    guestNameController.dispose();
    guestNoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    String familyName = widget.title;
    // print(familyName);

    void saveGuest() {
      final UserSave userSave = UserSave();
      final User? user = FirebaseAuth.instance.currentUser;
      const bool guestConfirmed = true;

      userSave.addGuest(user, familyName, guestNameController.text,
          guestNoteController.text, guestConfirmed);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kDarkWhiteColor,
        foregroundColor: kPrimaryBlack,
        title: const Text("Guest"),
        centerTitle: true,
        forceMaterialTransparency: true,
        iconTheme: const IconThemeData(color: kPrimaryBlue),
        actions: [
          IconButton(
            onPressed: () async {
              saveGuest();
              guestNameController.clear();
              guestNoteController.clear();
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
                    controller: guestNameController,
                    hintText: "Guest Name",
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
                    controller: guestNoteController,
                    hintText: "Guest Note",
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
