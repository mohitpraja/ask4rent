import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpController extends GetxController {
  String name=Get.arguments[1];
  String email=Get.arguments[2];
  String phone=Get.arguments[3];
  String password=Get.arguments[4];
  String verificationId=Get.arguments[0];
   var otp = '';

  final defaultPinTheme = PinTheme(
    width: 42,
    height: 42,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: primaryColor),
    ),
  );
 

}
