import 'dart:developer';
import 'dart:io';

import 'package:ask4rent/core/global/global_var.dart';
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

String verificationid = '';
Future sendOtp(phone, fun) async {
  await Fbase.auth.verifyPhoneNumber(
    phoneNumber: '+91$phone',
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException e) {
      CustomDialog(
        descText: '${e.message}',
      ).error();
    },
    codeSent: (String verificationId, int? resendToken) {
      verificationid = verificationId;
      fun();
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

verifyOTP(otp, verifyId, fun) async {
  AuthCredential phoneAuthCredential =
      PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otp);
  try {
    final authCred =
        await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
    if (authCred.user != null) {
      // Get.back();
      fun();
    }
  } on FirebaseAuthException {
    // Get.back();
    isButtonDisable.value=false;
    CustomDialog(
      descText: 'Invalid OTP',
    ).error();
    // const CustomSnackbar(msg: 'Invalid OTP', title: 'Warning').show();
    // Get.back();
  }
}
List imagesUrls = [];
Future uploadFiles(images) async {
  log('upload file cld');
  imagesUrls.clear();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    images.forEach((file) async {
      log('file : $file');
      final ext = file.path.split('.').last;
      final ref = Fbase.storage.ref().child('houses/${userInfo['id']}/$id.$ext');
      ref.putFile(File(file.path)).then((p0) async {
        await ref.getDownloadURL().then((value) => imagesUrls.add(value));
      });
    });
  }

