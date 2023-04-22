import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddExecutiveController extends GetxController{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();



  final addExecutiveFormKey = GlobalKey<FormState>();

}