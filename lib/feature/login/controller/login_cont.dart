import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    initPlatformState();
    super.onInit();
  }

  final loginFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  final otplessFlutter = Otpless();
  void initiateWhatsappLogin(String intentUrl) async {
    var result = await otplessFlutter.loginUsingWhatsapp(intentUrl: intentUrl);
    log('this is res :$result');
    switch (result['code']) {
      case "581":
        print(result['message']);
        break;
      default:
    }
  }

  Future<void> initPlatformState() async {
    otplessFlutter.authStream.listen((event) {
      print('event : $event');
    });

    otplessFlutter.authStream.listen((token) {
      print(token);
    });
  }
}
