import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './size_config.dart';

const Color kPinkColor = Color(0xFFE83F6F);
const Color kYellowColor = Color(0xffFFBF00);
const Color kDarkWhiteColor = Color(0xffEBEDF1);
const Color kBlackColor = Color(0xff172B4D);
const Color kLightBlackColor = Color(0xff434F65);
const Color kDarkGray = Color(0xff313638);

const Color kPrimaryGray = Color(0xffE8E9EB);
const Color kPrimaryBlue = Color(0xff3772FF);
const Color kPrimaryBlack = Color(0xff080708);

const Color gBColor = Color(0xFF031888);
const Color lightText = Color.fromARGB(255, 147, 147, 214);
const Color highlightText = Color(0xFFEF1F75);
const Color secoundGb = Color(0xFFDCDCDC);
const Color appDrawerColor = Color.fromARGB(255, 245, 245, 245);

final maxTitileSize = SizeConfig.blockSizeHorizontal! * 8;
final maxSubtitileSize = SizeConfig.blockSizeHorizontal! * 4;
final maxBtntitileSize = SizeConfig.blockSizeHorizontal! * 5.5;

final kTitleOnboarding = GoogleFonts.roboto(
  fontSize: maxTitileSize >= 40
      ? SizeConfig.blockSizeHorizontal! * 5
      : SizeConfig.blockSizeHorizontal! * 8,
  color: kDarkGray,
  fontWeight: FontWeight.bold,
);

final kSubtitleOnboarding = GoogleFonts.inter(
  fontSize: maxSubtitileSize >= 30
      ? SizeConfig.blockSizeHorizontal! * 2
      : SizeConfig.blockSizeHorizontal! * 4,
  color: kDarkGray,
);

final kTextButton = GoogleFonts.inter(
  color: kYellowColor,
  fontSize: maxBtntitileSize >= 35
      ? SizeConfig.blockSizeHorizontal! * 2.5
      : SizeConfig.blockSizeHorizontal! * 5.5,
  fontWeight: FontWeight.bold,
);
