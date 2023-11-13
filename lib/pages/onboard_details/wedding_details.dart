import 'package:flutter/material.dart';
import 'package:planner/pages/dashboard_page.dart';
import '../../size_config.dart';
import '../../app_style.dart';
import '../../widgets/input_task.dart';
import 'package:intl/intl.dart';

class WeddingDetails extends StatefulWidget {
  const WeddingDetails({super.key});

  @override
  State<WeddingDetails> createState() => _WeddingDetailsState();
}

class _WeddingDetailsState extends State<WeddingDetails> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  void _showDateTimePicker() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2050),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _showTime();
    }
  }

  void _showTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeVertical = SizeConfig.blockSizeVertical!;
    double sizeHorizontal = SizeConfig.blockSizeHorizontal!;

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
                      "Wedding",
                      style: TextStyle(color: kPinkColor, fontSize: 35),
                    ),
                    SizedBox(
                      width: sizeHorizontal * 4,
                    ),
                    const Text(
                      "Details",
                      style: TextStyle(color: kPrimaryBlack, fontSize: 35),
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

                // Date & Time
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Date & Time",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
                    ),
                    GestureDetector(
                      onTap: _showDateTimePicker,
                      child: Container(
                        height: sizeVertical * 9, // Set the height as needed
                        width: sizeHorizontal * 80, // Set the width as needed
                        padding: const EdgeInsets.all(
                            10), // Adjust padding as needed
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(
                              50), // Adjust border radius as needed
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 15.0),
                                  child: Icon(
                                    Icons.calendar_month,
                                    size: 35.0,
                                    color: kDarkGray,
                                  ),
                                ),
                                Text(
                                  "${DateFormat('yyyy-MM-dd').format(selectedDate.toLocal())} ${DateFormat('h:mm a').format(DateTime(2023, 1, 1, selectedTime.hour, selectedTime.minute))}",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 3,
                    ),
                    const Text(
                      "Location",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InputTask(
                          controller: locationController,
                          hintText: "Wedding Location",
                          inputKeyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          hintIcon: const Icon(
                            Icons.location_on_outlined,
                            size: 35.0,
                            color: kDarkGray,
                          ),
                          hintImage: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 3,
                    ),
                    const Text(
                      "Budget",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    SizedBox(
                      height: sizeVertical * 2,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: InputTask(
                          controller: budgetController,
                          hintText: "Wedding Budget",
                          inputKeyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          hintIcon: const Icon(
                            Icons.attach_money_rounded,
                            size: 35.0,
                            color: kDarkGray,
                          ),
                          hintImage: null,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeVertical * 7,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: sizeVertical * 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DashboardPage(),
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
