import 'dart:async';
import 'dart:developer';

import 'package:ask4rent/core/global/global_var.dart';
import 'package:ask4rent/core/routes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashController extends GetxController {
   bool isLogin = false;
  String post = '';
  @override
  void onInit() {
    super.onInit();
    getdata();
    Timer(const Duration(seconds: 2), () {
       if (isLogin) {
        if (post == 'Admin') {
          postStatus.value='1';
          Get.offAllNamed(Routes.adminHome);
        } else if (post == 'Executive') {
           postStatus.value='2';
          Get.offAllNamed(Routes.executiveHome);
        } else {
           postStatus.value='0';
          Get.offAllNamed(Routes.dashboard);
        }
      } else {
        Get.offAllNamed(Routes.login);
      }

     
    });
  }
   Future<void> getdata() async {
    var db = await Hive.openBox('ask4rent');
    final userInfo = db.get('userInfo');
    isLogin = db.get('isLogin');
    post=userInfo['post'];
    log('post : $post');
  }
}
