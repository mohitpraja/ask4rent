import 'dart:async';

import 'package:ask4rent/core/routes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashController extends GetxController {
  bool isLogin = false;
  @override
  void onInit() {
    super.onInit();
    getdata();
    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
          Get.offAllNamed(Routes.dashboard);
        
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }
   Future<void> getdata() async {
    var db = await Hive.openBox('ubivisit');
    isLogin = db.get('isLogin')!;
  }
}
