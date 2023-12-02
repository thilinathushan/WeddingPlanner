import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'wedding_details.dart';
import '../../widgets/input_task.dart';
import '../../services/user_save.dart';
import '../../size_config.dart';
import '../../app_style.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController yourNameController = TextEditingController();
  final TextEditingController partnerNameController = TextEditingController();

  @override
  void dispose() {
    yourNameController.dispose();
    partnerNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

    void savePersonalDetails() {
      final UserSave userSave = UserSave();
      final User? user = FirebaseAuth.instance.currentUser;

      userSave.updateUserPersonalData(
          user, yourNameController, partnerNameController);
    }

    return Scaffold(
      backgroundColor: kDarkWhiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                      "Personal",
                      style: TextStyle(
                        color: kPinkColor,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 4,
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(
                        color: kPrimaryBlack,
                        fontSize: 35,
                      ),
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
                      "Your Name",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: sizeVertical * 3,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      height: sizeVertical * 9, // Set the height as needed
                      width: sizeHorizontal * 80, // Set the width as needed
                      // Adjust padding as needed
                      decoration: BoxDecoration(
                        color: Colors.white, // Background color
                        borderRadius: BorderRadius.circular(
                            50), // Adjust border radius as needed
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InputTask(
                          controller: yourNameController,
                          hintText: "Your Name",
                          inputKeyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                    ),

                    //Partner Name
                    SizedBox(
                      height: sizeVertical * 4,
                    ),
                    const Text(
                      "Partner Name",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: sizeVertical * 3,
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InputTask(
                          controller: partnerNameController,
                          hintText: "Partner Name",
                          inputKeyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: sizeVertical * 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                savePersonalDetails();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const WeddingDetails(),
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
      ),
    );
  }
}
