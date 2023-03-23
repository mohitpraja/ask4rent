import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassController extends GetxController {
  TextEditingController password = TextEditingController();
  final forgotPassFormKey = GlobalKey<FormState>();
  String phone=Get.arguments[0]['phone'];

  
}
