import 'package:flutter/material.dart';

class AppStyles {
  static const Color primaryColor = Color(0xff4380F4);

  static const LinearGradient colorAppBar = LinearGradient(
    // colors: [Color(0xff6592f2), Color(0xff1f68f4)],
    colors: [Color(0xff4E86F3), Color(0xff1F69F6)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    tileMode: TileMode.clamp,
  );

  static const TextStyle titleAppBarBlack = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontWeight: FontWeight.w700,
    color: Color(0xff2E2E2E),
  );

  static TextStyle titleAppBarWhite = titleAppBarBlack.copyWith(color: Colors.white);

  static const TextStyle textButtonWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle textButtonGray = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontWeight: FontWeight.w600,
    color: Color(0xff888888),
  );

  static const TextStyle textButtonBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff2E2E2E),
  );

  static const TextStyle textButtonBlue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: primaryColor,
  );

  static const TextStyle textFeatures = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontWeight: FontWeight.w600,
    color: Color(0xff444444),
  );

  static const TextStyle textNormalBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xff323232),
  );
}