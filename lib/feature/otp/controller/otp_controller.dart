import 'package:ask4rent/core/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpController extends GetxController {
  String name=Get.arguments[0]['name']??"";
  String email=Get.arguments[0]['email']??"";
  String phone=Get.arguments[0]['phone'];
  String password=Get.arguments[0]['password']??"";
  String verificationId=Get.arguments[0]['verification'];
  String page=Get.arguments[1];
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
