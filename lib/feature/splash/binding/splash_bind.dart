
import 'package:ask4rent/feature/splash/controller/splash_cont.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }

}