import 'package:ask4rent/core/global/global_var.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final editProfileFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController(text: userInfo['name']);
  TextEditingController email = TextEditingController(text:userInfo['email']);
  
}
