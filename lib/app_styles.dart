import 'package:flutter/material.dart';

class AppStyles {

  static const TextStyle titleAppBarBlack = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xff2E2E2E),
  );

  static TextStyle titleAppBarWhite = titleAppBarBlack.copyWith(color: Colors.white);

  static const TextStyle textButtonWhite = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle textButtonBlack = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff2E2E2E),
  );

  static const TextStyle textButtonBlue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color(0xff4380F4),
  );
}