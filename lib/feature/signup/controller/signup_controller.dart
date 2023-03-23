import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
}
