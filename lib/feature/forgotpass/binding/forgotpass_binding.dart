import 'package:ask4rent/feature/forgotpass/controller/forgotpass_controller.dart';
import 'package:get/get.dart';

class ForgotPassBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ForgotPassController());
  }

}