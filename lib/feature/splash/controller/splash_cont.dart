import 'dart:async';

import 'package:ask4rent/core/routes.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    var db = await Hive.openBox('ask4rent');
    bool isLogin = db.get('isLogin');
    Timer(const Duration(seconds: 3),
        () => isLogin ? Routes.dashboard : Routes.login);
    super.onInit();
  }
}
