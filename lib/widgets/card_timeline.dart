import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../app_style.dart';
import '../models/db_user_model.dart';
import '../providers/user_details_provider.dart';
import '../services/user_save.dart';
import '../size_config.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CardTimeLine extends StatefulWidget {
  const CardTimeLine({super.key});

  @override
  State<CardTimeLine> createState() => _CardTimeLineState();
}

class _CardTimeLineState extends State<CardTimeLine> {
  File? selectedImage;

  Future _pickImageFromGallery() async {
    XFile? returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
    });
    // print('${returnImage.path}');
    // print("selected file : $selectedImage");
  }

  @override
  Widget build(BuildContext context) {
    UserData? userData = Provider.of<UserDetailsProvider>(context).userData;

    SizeConfig().init(context);
    double screenWidth = SizeConfig.screenWidth!;
    double useableSizeVertical = SizeConfig.useableBlockSizeVertical!;

    // print("useableSizeVerticle $useableSizeVertical");

    String countDownTime = userData!.dateTime;
    String yourName = userData.yourName;
    String partnerName = userData.partnerName;
    String? timeCounterPhotoURL = userData.timeCounterPhotoURL;
    // print("TIMECOUNTER URL: $timeCounterPhotoURL");

// Extract date and time components
    List<String> dateTimeComponents = countDownTime.split(' ');
    String datePart = dateTimeComponents[0];
    String timePart = dateTimeComponents[1];
    String secondPart = ":00";
    String dateTimePart = '$datePart $timePart$secondPart';

// Create DateTime object
    DateTime endTime = DateTime.parse(dateTimePart);

    DateTime now = DateTime.now();
    Duration remainingDuration = endTime.difference(now);

// Calculate days, minutes, and seconds
    int days = remainingDuration.inDays;
    int hours = remainingDuration.inHours % 24;
    int minutes = remainingDuration.inMinutes % 60;
    int seconds = remainingDuration.inSeconds % 60;

    final User? user = FirebaseAuth.instance.currentUser;

    void saveTimeCounterPhoto() {
      final UserSave userSave = UserSave();
      // print("Selected : $selectedImage");
      userSave.storageTimeCounterPhoto(user, selectedImage);
    }

    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        top: 15.0,
        right: 10.0,
      ),
      child: Container(
        width: screenWidth,
        height: useableSizeVertical * 23,
        decoration: const BoxDecoration(
          color: kPrimaryGray,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Scaffold(
            backgroundColor: kPrimaryGray,
            body: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$yourName & $partnerName",
                      style: const TextStyle(
                        color: kPrimaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TimerCountdown(
                            format:
                                CountDownTimerFormat.daysHoursMinutesSeconds,
                            endTime: DateTime.now().add(
                              Duration(
                                days: days,
                                hours: hours,
                                minutes: minutes,
                                seconds: seconds,
                              ),
                            ),
                            descriptionTextStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            timeTextStyle: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            spacerWidth: 6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    if (timeCounterPhotoURL != null &&
                        timeCounterPhotoURL.isNotEmpty)
                      CircleAvatar(
                        radius: useableSizeVertical * 7,
                        backgroundColor: Colors.blue,
                        backgroundImage: NetworkImage(timeCounterPhotoURL),
                      )
                    else
                      CircleAvatar(
                        radius: useableSizeVertical * 7.5,
                        backgroundColor: Colors.blue,
                        backgroundImage: const NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/08/06/18/05/people-2594745_1280.jpg",
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          await _pickImageFromGallery();
                          if (selectedImage != null) {
                            saveTimeCounterPhoto();
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(20),
                          ),
                          child: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                        ),
                      ),
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
