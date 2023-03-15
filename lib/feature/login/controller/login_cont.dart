import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController{
  final loginFormKey=GlobalKey<FormState>();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
}
