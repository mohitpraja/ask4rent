import 'package:flutter/material.dart';
import 'package:get/get.dart';
// var commonSpace=Get.height * 0.02;
commonSpace(){
  return SizedBox(
    height: Get.height*0.02,
    
  );
}
commonSpace1(){
  return SizedBox(
    height: Get.height*0.015,
    
  );
}
RxBool isPass = true.obs;
RxBool isButtonDisable = false.obs;

showPass() {
  if (isPass.value == true) {
    isPass.value = false;
  } else {
    isPass.value = true;
  }
}
