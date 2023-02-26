import 'package:ask4rent/feature/signup/controller/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignupController());
  }

}