import 'package:ask4rent/core/widgets/custom_dialog.dart';
import 'package:ask4rent/core/widgets/custom_loader.dart';
import 'package:ask4rent/services/firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

// var commonSpace=Get.height * 0.02;
commonSpace() {
  return SizedBox(
    height: Get.height * 0.02,
  );
}

commonSpace1() {
  return SizedBox(
    height: Get.height * 0.015,
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

Future checkInternet(fun) async {
  CustomLoader().loader();
  if (!(await InternetConnectionChecker().hasConnection)) {
    Get.back();
    CustomDialog(
      descText: 'Check internet connection',
    ).warning();
  } else {
    Get.back();
    fun();
  }
}

Future sendOtp() async {
  CustomLoader().loader();
  await Fbase.auth.verifyPhoneNumber(
    phoneNumber: '+918103586806',
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {
      Get.back();
      CustomDialog(descText: '${e.message}').error();
    },
    codeSent: (String verificationId, int? resendToken) {
      Get.back();
      checkInternet(() {
        CustomDialog().success();
      });
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}
