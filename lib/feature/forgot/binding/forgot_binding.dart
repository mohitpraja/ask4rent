import 'package:ask4rent/feature/forgot/controller/forgot_controller.dart';
import 'package:get/get.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotController());
  }
}
