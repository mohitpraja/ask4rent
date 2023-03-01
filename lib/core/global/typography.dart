import 'package:ask4rent/core/global/colors.dart';
import 'package:ask4rent/core/global/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyle {
  static TextStyle splashStyle = TextStyle(
      fontSize: Get.width * 0.12, fontFamily: pacifico, color: Colors.white);
  static TextStyle appTitile = TextStyle(
      fontSize: Get.width * 0.06, fontFamily: pacifico, color: Colors.white);
  static TextStyle appCity = TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: alata,
      letterSpacing: 1,
      fontSize: Get.width * 0.04);
  static TextStyle rentingMadeEasy = TextStyle(
      fontSize: Get.width * 0.08,
      fontFamily: josefin,
      fontWeight: FontWeight.bold);
  static TextStyle subheading = TextStyle(
      fontSize: Get.width * 0.05,
      color: lightBlack,
      fontWeight: FontWeight.w400);
  static TextStyle popularLocality = TextStyle(
      fontSize: Get.width * 0.075,
      fontFamily: ubuntu,
      fontWeight: FontWeight.bold);
  static TextStyle popularLocalityOrange = TextStyle(
      fontSize: Get.width * 0.075,
      fontFamily: ubuntu,
      color: primaryColor,
      fontWeight: FontWeight.bold);
  static TextStyle cityTitle = TextStyle(
      fontSize: Get.width * 0.065,
      fontFamily: josefin,
      fontWeight: FontWeight.bold);
  static TextStyle drawerStyle = TextStyle(
      fontSize: Get.width * 0.045,
      fontWeight: FontWeight.w500,
      fontFamily: alata);
  static TextStyle drawerHeading = TextStyle(
      fontSize: Get.width * 0.075,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: alata);
  static TextStyle drawerHeading1 = TextStyle(
      fontSize: Get.width * 0.05,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: alata);
  static TextStyle search = TextStyle(
      fontSize: Get.width * 0.045,
      fontFamily: josefin,
      );
}
