import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './size_config.dart';

const Color kPinkColor = Color(0xffE83F6F);
const Color kYellowColor = Color(0xffFFBF00);
const Color kDarkWhiteColor = Color(0xffEBEDF1);
const Color kBlackColor = Color(0xff172B4D);
const Color kLightBlackColor = Color(0xff434F65);
const Color kDarkGray = Color(0xff313638);

const Color kPrimaryGray = Color(0xffE8E9EB);
const Color kPrimaryBlue = Color(0xff3772FF);
const Color kPrimaryBlack = Color(0xff080708);

final kTitleOnboarding = GoogleFonts.roboto(
  fontSize: SizeConfig.blockSizeHorizontal! * 8,
  color: kDarkGray,
  fontWeight: FontWeight.bold,
);

final kSubtitleOnboarding = GoogleFonts.inter(
  fontSize: SizeConfig.blockSizeHorizontal! * 4,
  color: kDarkGray,
);

final kTextButton = GoogleFonts.inter(
  color: kYellowColor,
  fontSize: SizeConfig.blockSizeHorizontal! * 5.5,
  fontWeight: FontWeight.bold,
);
