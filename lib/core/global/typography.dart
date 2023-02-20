import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyle {
  static TextStyle splashStyle = TextStyle(
      fontSize: Get.width * 0.12,
      fontFamily: CustomFonts.pacifico,
      color: Colors.white);
  static TextStyle appTitile = TextStyle(
      fontSize: Get.width * 0.06,
      fontFamily: CustomFonts.pacifico,
      color: Colors.white);
  static TextStyle appCity = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: CustomFonts.alata,
      letterSpacing: 1,
      fontSize: Get.width * 0.04);
}
