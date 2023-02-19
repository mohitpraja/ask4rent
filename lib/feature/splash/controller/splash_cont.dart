import 'dart:async';

import 'package:ask4rent/core/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(const Duration(seconds: 3), () => Get.offAllNamed(Routes.login));
    super.onInit();
  }
}
